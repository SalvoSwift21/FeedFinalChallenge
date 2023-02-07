//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Salvatore Milazzo on 14/11/22.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
