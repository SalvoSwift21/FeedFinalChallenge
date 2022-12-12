//
//  File.swift
//  EssentialFeediOS
//
//  Created by Salvatore Milazzo on 05/12/22.
//
import UIKit

 extension UIRefreshControl {
     func update(isRefreshing: Bool) {
         isRefreshing ? beginRefreshing() : endRefreshing()
     }
 }
