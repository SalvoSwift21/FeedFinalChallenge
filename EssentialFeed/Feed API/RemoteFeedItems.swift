//
//  RemoteFeedItems.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 27/09/22.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
