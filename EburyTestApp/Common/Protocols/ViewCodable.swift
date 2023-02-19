//
//  ViewCodable.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

// MARK: - ViewCodable
// This protocol establishes a View Code pipeline
protocol ViewCodable {
  // Creates the hierarchy of the view
  func buildViewHierarchy()
  // Establishes the constraints for AutoLayout
  func setUpConstraints()
  // Performs additional configuration
  func configureViews()
}

extension ViewCodable {
  // Makes this method as optional
  func configureViews() { }
  
  // Triggers the pipeline
  func buildView() {
    buildViewHierarchy()
    setUpConstraints()
    configureViews()
  }
}
