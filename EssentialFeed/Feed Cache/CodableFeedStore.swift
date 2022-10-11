//
//  CodableFeedStore.swift
//  EssentialDeveloperFeed
//
//  Created by Salvatore Milazzo on 11/10/22.
//

import Foundation

public class CodableFeedStore: FeedStore {
    
    private struct Cache: Codable {
        let feed: [CodableFeedImage]
        let date: Date
        
        var localFeed: [LocalFeedImage] {
            return feed.map({ $0.local })
        }
    }
    
    private struct CodableFeedImage: Codable {
        private let id: UUID
        private let description: String?
        private let location: String?
        private let url: URL
        
        init(_ image: LocalFeedImage) {
            id = image.id
            description = image.description
            location = image.location
            url = image.url
        }
        
        var local: LocalFeedImage {
            return LocalFeedImage(id: id, description: description, location: location, url: url)
        }
    }
    
    private let storeUrl: URL
    
    public init(storeUrl: URL) {
        self.storeUrl = storeUrl
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertCompletion) {
        do {
            let encoder = JSONEncoder()
            let cache = Cache(feed: feed.map(CodableFeedImage.init), date: timestamp)
            let econded = try! encoder.encode(cache)
            try econded.write(to: storeUrl)
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    public func retrive(completion: @escaping RetrievalCompletion) {
        guard let data = try? Data(contentsOf: storeUrl) else {
            return completion(.empty)
        }
        do {
            let decoder = JSONDecoder()
            let cache = try decoder.decode(Cache.self, from: data)
            completion(.found(feed: cache.localFeed, timestamp: cache.date))
        } catch {
            completion(.failure(error))
        }
    }
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        guard FileManager.default.fileExists(atPath: storeUrl.path) else {
            return completion(nil)
        }
        
        do {
            try FileManager.default.removeItem(at: storeUrl)
            completion(nil)
        } catch {
            completion(error)
        }
    }

}
