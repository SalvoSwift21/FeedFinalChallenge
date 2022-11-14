//
//  EssentialFeed:EssentialFeediOSTests:Helpers:UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Salvatore Milazzo on 14/11/22.
//

import Foundation
import UIKit

extension UIRefreshControl {
     func simulatePullToRefresh() {
         allTargets.forEach { target in
             actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                 (target as NSObject).perform(Selector($0))
             }
         }
     }
 }
