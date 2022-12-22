//
//  File.swift
//  EssentialAppTests
//
//  Created by Salvatore Milazzo on 22/12/22.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}

