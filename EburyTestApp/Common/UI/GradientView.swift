//
//  GradientView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class GradientView: UIView {
  
  private lazy var gradientLayer = CAGradientLayer()
  
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
    gradientLayer.removeFromSuperlayer()
    gradientLayer.colors = [ColorPalette.appCyan.cgColor, ColorPalette.appBlue.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    gradientLayer.frame = self.bounds
    self.layer.insertSublayer(gradientLayer, at: 0)
  }
}
