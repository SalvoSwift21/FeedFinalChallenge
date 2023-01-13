//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Salvatore Milazzo on 18/11/22.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        return location != nil
    }
}
