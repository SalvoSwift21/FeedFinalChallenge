//
//  FeedStore.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 26/09/22.
//

import Foundation

public enum RetrieveCachedFeedResult {
    case empty
    case found(feed: [LocalFeedImage], timestamp: Date)
    case failure(Error)
}

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertCompletion = (Error?) -> Void
    typealias RetrievalCompletion = (RetrieveCachedFeedResult) -> Void

    ///The completion handler can be invoked in any thread
    ///Clients are responsible to dispatch to appropriate threads, if needed.
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    ///The completion handler can be invoked in any thread
    ///Clients are responsible to dispatch to appropriate threads, if needed.
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertCompletion)
    ///The completion handler can be invoked in any thread
    ///Clients are responsible to dispatch to appropriate threads, if needed.
    func retrive(completion: @escaping RetrievalCompletion)
}
