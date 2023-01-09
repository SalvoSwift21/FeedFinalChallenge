//
//  FeedCache.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 16/12/22.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
