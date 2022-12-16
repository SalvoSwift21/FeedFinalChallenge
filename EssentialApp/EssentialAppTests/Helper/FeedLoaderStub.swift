//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Salvatore Milazzo on 16/12/22.
//

import EssentialDeveloperFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
