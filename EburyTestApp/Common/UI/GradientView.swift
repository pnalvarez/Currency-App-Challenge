//
//  GradientView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

// MARK: - GradientView
// View where the background is a gradient of the two main colors of the palette
final class GradientView: UIView {
  // MARK: - UI properties
  private lazy var gradientLayer = CAGradientLayer()
  
  // MARK: - Lifecycle
  override func layoutSubviews() {
    applyGradient()
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    // If there are changes to the colors regarding dark/light mode, reinsert gradient in order to update interface
    if let hasUserInterfaceStyleChanged = previousTraitCollection?.hasDifferentColorAppearance(comparedTo: traitCollection),
      hasUserInterfaceStyleChanged {
      applyGradient()
    }
  }
  
  private func applyGradient() {
    // Remove previous layer in order to insert an updated one
    gradientLayer.removeFromSuperlayer()
    // Gradient colors
    gradientLayer.colors = [ColorPalette.appSecondary.cgColor, ColorPalette.appPrimary.cgColor]
    // Define direction of gradient
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    // Define frame
    gradientLayer.frame = bounds
    // Insert new configuation
    layer.insertSublayer(gradientLayer, at: 0)
  }
}
