//
//  FeedEndpointTests.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 25/01/23.
//

import XCTest
import EssentialDeveloperFeed

class FeedEndpointTests: XCTestCase {
    
    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!
        
        let received = FeedEndpoint.get.url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/feed")!
        
        XCTAssertEqual(received, expected)
    }
    
}
