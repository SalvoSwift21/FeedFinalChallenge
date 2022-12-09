//
//  ShareTestHelpers.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 29/09/22.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0, userInfo: nil)
}

func anyData() -> Data {
     return Data("any data".utf8)
 }
