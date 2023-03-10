//
//  FeedCacheTestHelper.swift
//  EssentialDeveloperFeedTests
//
//  Created by Salvatore Milazzo on 29/09/22.
//

import Foundation
import EssentialDeveloperFeed


func uniqueImage() -> FeedImage {
    return FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map({ LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url )})
    return (models, local)
}


extension Date {
    
    private var feedCacheMaxAgeInDays: Int {
        return 7
    }
    
    func minusFeedCacheMaxAge() -> Date {
        return adding(days: -feedCacheMaxAgeInDays)
    }
}

