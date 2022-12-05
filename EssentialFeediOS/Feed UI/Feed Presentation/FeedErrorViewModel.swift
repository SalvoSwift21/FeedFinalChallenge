//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Salvatore Milazzo on 05/12/22.
//

import Foundation

struct FeedErrorViewModel {
     let message: String?

     static var noError: FeedErrorViewModel {
         return FeedErrorViewModel(message: nil)
     }

     static func error(message: String) -> FeedErrorViewModel {
         return FeedErrorViewModel(message: message)
     }
 }
