//
//  ColorPalette.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

// MARK: - ColorPalette
enum ColorPalette {
  static let appGray = UIColor(hex: 0x8e8e93)
  static let appPrimary = UIColor(named: "primary") ?? UIColor(hex: 0x48d1db)
  static let appSecondary = UIColor(named: "secondary") ?? UIColor(hex: 0x00bef0)
  static let backgroundGray = UIColor(named: "backgroundGray") ?? UIColor(hex: 0xf9f9f9)
  static let appWhite = UIColor(hex: 0xffffff)
  static let productGray = UIColor(hex: 0x3c3c43)
  static let amountBackground = UIColor(named: "amountBackground") ?? .white
  static let tabBar = UIColor(named: "tabBar") ?? UIColor(hex: 0xf9f9f9)
  static let mainShadow = UIColor(hex: 0x000000).withAlphaComponent(0.2)
}
