//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Salvatore Milazzo on 25/11/22.
//

import Foundation
import XCTest
import EssentialDeveloperFeed

final class FeedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
}
