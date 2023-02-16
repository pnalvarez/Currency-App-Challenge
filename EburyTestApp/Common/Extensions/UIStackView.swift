//
//  UIStackView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

extension UIStackView {
  func addArrangedSubviews(_ views: UIView...) {
    for view in views {
      addArrangedSubview(view)
    }
  }
}
