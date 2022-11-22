//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Salvatore Milazzo on 18/11/22.
//

import Foundation
import EssentialDeveloperFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
