//
//  CodableFeedStoreTest.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 10/10/22.
//

import XCTest
import EssentialDeveloperFeed

class CodableFeedStore {
    
    struct Cache: Codable {
        let feed: [LocalFeedImage]
        let date: Date
    }
    
    private let storeUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("image-feed.store")
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping FeedStore.InsertCompletion) {
        let encoder = JSONEncoder()
        let econded = try! encoder.encode(Cache(feed: feed, date: timestamp))
        try! econded.write(to: storeUrl)
        completion(nil)
    }
    
    func retrive(completion: @escaping FeedStore.RetrievalCompletion) {
        guard let data = try? Data(contentsOf: storeUrl) else {
            return completion(.empty)
        }
        let decoder = JSONDecoder()
        let cache = try! decoder.decode(Cache.self, from: data)
        completion(.found(feed: cache.feed, timestamp: cache.date))
    }

}

class CodableFeedStoreTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let storeUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("image-feed.store")
        try? FileManager.default.removeItem(at: storeUrl)
    }
    
    override func tearDown() {
        super.tearDown()
        let storeUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("image-feed.store")
        try? FileManager.default.removeItem(at: storeUrl)
    }
    
    func test_retrive_deliversEmptyOnEmptyCache() {
        let sut = CodableFeedStore()
        
        let exp = expectation(description: "Wait for cache retrieval")
        
        sut.retrive { result in
            switch result {
            case .empty:
                break
            default:
                XCTFail()
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_retrive_hasNoSideEffectsOnEmptyCache() {
        let sut = CodableFeedStore()
        
        let exp = expectation(description: "Wait for cache retrieval")
        
        sut.retrive { firstResult in
            sut.retrive { result in
                switch (firstResult, result) {
                case (.empty, .empty):
                    break
                default:
                    XCTFail()
                }
                
                exp.fulfill()
            }
        }
            
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_retriveAfterInsertingToEmptyCache_deliversInsertedValues() {
        let sut = CodableFeedStore()
        let feed = uniqueImageFeed().local
        let timestamp = Date()
        
        let exp = expectation(description: "Wait for cache retrieval")
        
        sut.insert(feed, timestamp: timestamp) { insertionError in
            XCTAssertNil(insertionError, "Expected geed to be inserted")
            sut.retrive { retrivedResult in
                switch retrivedResult {
                case let .found(retrivedResult, retrivedTimestamp):
                    XCTAssertEqual(retrivedResult, feed)
                    XCTAssertEqual(retrivedTimestamp, timestamp)
                default:
                    XCTFail()
                }
                
                exp.fulfill()
            }
        }
            
        wait(for: [exp], timeout: 1.0)
    }
}
