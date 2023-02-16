//
//  ViewCodable.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

protocol ViewCodable {
  func buildViewHierarchy()
  func setUpConstraints()
  func configureViews()
}

extension ViewCodable {
  func configureViews() { }
  
  func buildView() {
    buildViewHierarchy()
    setUpConstraints()
    configureViews()
  }
}
