//
//  FeedPresenterTests.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 05/12/22.
//

import XCTest
import EssentialDeveloperFeed

class FeedPresenterTests: XCTestCase {

    func test_title_isLocalized() {
        XCTAssertEqual(FeedPresenter.title, localized("FEED_VIEW_TITLE"))
    }
    
    // MARK: - Helpers
    private func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }

}
