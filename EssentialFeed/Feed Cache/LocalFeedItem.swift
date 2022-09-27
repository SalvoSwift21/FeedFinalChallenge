//
//  LocalFeedItem.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 27/09/22.
//

import Foundation

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
