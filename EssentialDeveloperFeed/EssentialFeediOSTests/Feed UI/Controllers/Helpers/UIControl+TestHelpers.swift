//
//  File.swift
//  EssentialFeediOSTests
//
//  Created by Salvatore Milazzo on 14/11/22.
//

import Foundation
import UIKit

extension UIControl {
     func simulate(event: UIControl.Event) {
         allTargets.forEach { target in
             actions(forTarget: target, forControlEvent: event)?.forEach {
                 (target as NSObject).perform(Selector($0))
             }
         }
     }
 }
