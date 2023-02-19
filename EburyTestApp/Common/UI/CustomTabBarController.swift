//
//  CustomTabBarController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

// MARK: - CustomTabBarController
// Custom UITabBarController for stylizing the tab bar
class CustomTabBarController: UITabBarController {
  // MARK: - Constants
  private enum Constants {
    static let bottomOffset: CGFloat = 64
    static let tabBarCornerRadius: CGFloat = 10
    static let customViewRadius: CGFloat = 30
    static let shadowOffset: CGSize = .init(width: -4, height: -6)
    static let shadowOpacity: Float = 0.5
    static let shadowRadius: CGFloat = 20
  }
  
  private lazy var customView = UIView()
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    configureCustomFrame()
  }
  
  // MARK: Private methods
  private func configureTabBar() {
    // Configure Tab Bar appearance
    tabBar.backgroundColor = ColorPalette.tabBar
    tabBar.layer.cornerRadius = Constants.tabBarCornerRadius
    tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    tabBar.tintColor = ColorPalette.appSecondary
    tabBar.unselectedItemTintColor = ColorPalette.appGray
    // Retrieve tab bar appearance
    let appearance = tabBar.standardAppearance
    tabBar.standardAppearance = appearance
    // Configure Custom View
    customView.frame = tabBar.frame
    customView.backgroundColor = ColorPalette.tabBar
    customView.layer.cornerRadius = Constants.customViewRadius
    customView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    customView.layer.shadowColor = ColorPalette.mainShadow.cgColor
    customView.layer.shadowOffset = Constants.shadowOffset
    customView.layer.shadowOpacity = Constants.shadowOpacity
    customView.layer.shadowRadius = Constants.shadowRadius
    view.addSubview(customView)
    view.bringSubviewToFront(tabBar)
  }
  
  private func configureCustomFrame() {
    let height = view.safeAreaInsets.bottom + Constants.bottomOffset
    var frame = tabBar.frame
    frame.size.height = height
    frame.origin.y = view.frame.size.height - height
    tabBar.frame = frame
    tabBar.layoutIfNeeded()
    customView.frame = tabBar.frame
  }
}
