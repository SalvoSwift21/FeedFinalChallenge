//
//  FeedImagePresenter.swift
//  EssentialFeediOS
//
//  Created by Salvatore Milazzo on 22/11/22.
//

import Foundation

public final class FeedImagePresenter {
     public static func map(_ image: FeedImage) -> FeedImageViewModel {
         FeedImageViewModel(
             description: image.description,
             location: image.location)
     }
 }
