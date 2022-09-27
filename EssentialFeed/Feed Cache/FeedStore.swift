//
//  FeedStore.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 26/09/22.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertCompletion)
}

public struct LocalFeedItem: Equatable {
    
    public init(id: UUID, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
    
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
}
