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
        simulate(event: .touchUpInside)
    }
}
