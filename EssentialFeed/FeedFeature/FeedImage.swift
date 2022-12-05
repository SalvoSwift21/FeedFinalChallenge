//
//  FeedImage.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 20/05/22.
//

import Foundation

public struct FeedImage: Hashable {
    
    public init(id: UUID, description: String?, location: String?, url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
    
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL
}
