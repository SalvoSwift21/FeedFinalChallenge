//
//  FeedItem.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 20/05/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let image: String?
}
