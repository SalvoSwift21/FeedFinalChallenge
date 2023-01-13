//
//  File.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 05/12/22.
//

import XCTest
import EssentialDeveloperFeed

class FeedImagePresenterTests: XCTestCase {
    
    func test_map_createsViewModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
    
}
