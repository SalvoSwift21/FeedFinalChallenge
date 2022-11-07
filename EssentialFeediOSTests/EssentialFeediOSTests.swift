//
//  EssentialFeediOSTests.swift
//  EssentialFeediOSTests
//
//  Created by Salvatore Milazzo on 05/11/22.
//

import XCTest

final class FeedViewController {
    
    init(loader: FeedViewControllerTests.LoaderSpy) {
        
    }
    
}

final class FeedViewControllerTests: XCTestCase {

    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        let sut = FeedViewController(loader: loader)
        XCTAssertEqual (loader.loadCallCount, 0)
    }
    
    class LoaderSpy {
        private (set) var loadCallCount: Int = 0
    }
}
