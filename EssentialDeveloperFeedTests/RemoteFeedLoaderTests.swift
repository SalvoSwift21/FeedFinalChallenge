//
//  RemoteFeedLoaderTests.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 20/05/22.
//

import XCTest
import EssentialDeveloperFeed

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT()

        sut.load() { _ in }
        
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT()

        sut.load() { _ in }
        sut.load() { _ in }
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        
        var captureErrors =  [RemoteFeedLoader.Error]()
        
        sut.load { captureErrors.append($0) }
        
        let clientError = NSError(domain: "Test", code: 0)
        client.complete(with: clientError)
        
        XCTAssertEqual(captureErrors, [.connectivity])
    }
    
    func test_load_deliversErrorOnClientErrorNon200HTTPResponse() {
        let (sut, client) = makeSUT()
        
        let samples = [199, 201, 300, 400, 500]
        
        samples.enumerated().forEach { index, code in
            
            var captureErrors =  [RemoteFeedLoader.Error]()
            sut.load { captureErrors.append($0) }
            
            client.complete(withStatusCode: code, at: index)
            
            XCTAssertEqual(captureErrors, [.invalidData])
        }
    }
    
    func test_load_deliversErrorOn200HTTResponseWithInvalidJSON() {
        let (sut, client) = makeSUT()
        
        var captureErrors =  [RemoteFeedLoader.Error]()
        sut.load { captureErrors.append($0) }
        
        let invalidJSON = "test".data(using: .utf8)!
        
        client.complete(withStatusCode: 200, data: invalidJSON)
        
        XCTAssertEqual(captureErrors, [.invalidData])
    }
    
    //MARK: - Helper
    private func makeSUT(url: URL = URL(string: "https://a-given-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
    
        private var messages = [(url: URL, completion: (HTTPClientResult) -> Void)]()
        
        var requestedURLs: [URL] {
            return messages.map({ $0.url })
        }
        
        func get(from url: URL,
                 completion: @escaping (HTTPClientResult) -> Void) {
            messages.append((url, completion))
        }
        
        func complete(with error: Error, at index: Int = 0)
        {
            messages[index].completion(.failure(error))
        }
        
        func complete(withStatusCode code: Int, data: Data = Data(), at index: Int = 0)
        {
            let response = HTTPURLResponse(url: requestedURLs[index], statusCode: code, httpVersion: nil, headerFields: nil)!
            messages[index].completion(.success(data, response))
        }
    }

}
