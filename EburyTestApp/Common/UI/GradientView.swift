//
//  GradientView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class GradientView: UIView {
  
  override func layoutSubviews() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [ColorPalette.appCyan.cgColor, ColorPalette.appBlue.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    gradientLayer.frame = self.bounds
    self.layer.insertSublayer(gradientLayer, at: 0)
  }
}
