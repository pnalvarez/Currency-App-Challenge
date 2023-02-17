//
//  RoundedShadowView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class RoundShadowView: UIView {
  
  private lazy var containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layoutView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func layoutView() {
    
    // set the shadow of the view's layer
    layer.backgroundColor = UIColor.clear.cgColor
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0, height: -8.0)
    layer.shadowOpacity = 0.12
    layer.shadowRadius = 10.0
    containerView.layer.cornerRadius = 8
    containerView.layer.masksToBounds = true
    
    addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    // pin the containerView to the edges to the view
    containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
}
