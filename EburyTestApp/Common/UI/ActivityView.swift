//
//  ActivityView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class ActivityView: UIActivityIndicatorView {
  override var intrinsicContentSize: CGSize {
    CGSize(width: frame.width, height: 48)
  }
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    color = .white
    hidesWhenStopped = true
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
