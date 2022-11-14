//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Salvatore Milazzo on 14/11/22.
//

import Foundation
import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
