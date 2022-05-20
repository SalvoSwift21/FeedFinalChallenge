//
//  FeedLoader.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 20/05/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
