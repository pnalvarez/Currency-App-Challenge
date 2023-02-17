//
//  ProfileButton.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class ProfileButton: UIButton {
  override var intrinsicContentSize: CGSize {
    CGSize(width: 28, height: 28)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setImage(UIImage(named: "profile"), for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
