//
//  UITabBarController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

extension UITabBarController {
  static func setAppearance() {
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ColorPalette.appCyan], for:.selected)
    UITabBar.appearance().backgroundColor = ColorPalette.backgroundGrey
    UITabBar.appearance().layer.cornerRadius = 8
    UITabBar.appearance().layer.borderWidth = 1
    UITabBar.appearance().tintColor = ColorPalette.appCyan
  }
}
