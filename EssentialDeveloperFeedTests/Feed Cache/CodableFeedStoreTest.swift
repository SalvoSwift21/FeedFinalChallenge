//
//  CodableFeedStoreTest.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 10/10/22.
//

import XCTest
import EssentialDeveloperFeed

class CodableFeedStore {
    func retrive(completion: @escaping FeedStore.RetrievalCompletion) {
        completion(.empty)
    }
}

class CodableFeedStoreTest: XCTestCase {
    
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
}
