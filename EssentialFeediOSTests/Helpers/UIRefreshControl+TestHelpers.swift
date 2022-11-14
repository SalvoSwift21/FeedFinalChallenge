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
         simulate(event: .touchUpInside)
     }
 }
