//
//  File.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 12/12/22.
//

import Foundation


public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
