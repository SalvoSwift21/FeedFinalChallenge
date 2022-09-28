//
//  LoadFeedFromCacheUseCaseTest.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 28/09/22.
//

import XCTest
import EssentialDeveloperFeed

final class LoadFeedFromCacheUseCaseTest: XCTestCase {

    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    func test_load_requestsCacheRetrieval() {
        let (sut, store) = makeSUT()
        sut.load() { _ in }
        XCTAssertEqual(store.receivedMessages, [.retrive])
    }

    func test_load_failsOnRetrievalError() {
        let (sut, store) = makeSUT()
        let retrievalError = anyError()
        let exp = expectation(description: "Wait for save completion")
        var receivedError: Error?
        
        sut.load { result in
            switch result {
            case let .failure(error):
                receivedError = error
            default:
                XCTFail("Not correct at all. For result \(result)")
            }
            exp.fulfill()
        }
        store.completeRetrieval(with: retrievalError)
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(receivedError as NSError?, retrievalError)
    }
    
    
    func test_load_deliversNoImagesOnEmptyCache() {
        let (sut, store) = makeSUT()
        let exp = expectation(description: "Wait for save completion")
        var receivedImages: [FeedImage]?
        
        sut.load { result in
            switch result {
            case let .success(images):
                receivedImages = images
            default:
                XCTFail("Not correct at all. For result \(result)")
            }
            exp.fulfill()
        }
        
        store.completeRetrievalWithEmptyCache()
        wait(for: [exp], timeout: 1.0)
        
        XCTAssertEqual(receivedImages, [])
    }
    
    //MARK: Helpers

    private func makeSUT(currentDate: @escaping () -> Date = Date.init,
                         file: StaticString = #filePath,
                         line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    private func anyURL() -> URL {
        return URL(string: "https://any-url.com")!
    }
    
    private func anyError() -> NSError {
        return NSError(domain: "any error", code: 0, userInfo: nil)
    }
}
