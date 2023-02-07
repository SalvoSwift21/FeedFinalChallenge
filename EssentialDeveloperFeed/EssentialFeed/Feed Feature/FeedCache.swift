//
//  FeedCache.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 16/12/22.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
