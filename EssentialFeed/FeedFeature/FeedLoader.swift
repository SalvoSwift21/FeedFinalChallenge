//
//  FeedLoader.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 20/05/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
