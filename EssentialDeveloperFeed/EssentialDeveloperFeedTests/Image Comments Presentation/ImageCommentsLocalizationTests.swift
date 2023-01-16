//
//  File.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 16/01/23.
//

import XCTest
import EssentialDeveloperFeed

class ImageCommentsLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
}
