//
//  XCTestCaseMemoryTracking.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 13/06/22.
//

import Foundation
import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject,
                                     file: StaticString = #filePath,
                                     line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "instance should have been deallocated", file: file, line: line)
        }
    }
}
