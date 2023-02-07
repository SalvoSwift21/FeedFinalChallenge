//
//  FeedImageDataCache.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 16/12/22.
//

import Foundation

public protocol FeedImageDataCache {    
    func save(_ data: Data, for url: URL) throws
}
