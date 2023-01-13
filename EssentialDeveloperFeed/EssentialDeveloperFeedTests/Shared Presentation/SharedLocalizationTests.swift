//
//  SharedLocalizationTests.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 13/01/23.
//

import XCTest
import EssentialDeveloperFeed

class SharedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
}
