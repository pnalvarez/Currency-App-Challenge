//
//  ProductsViewModel.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

protocol ProductsViewModelable {
  var title: String { get }
  var warningImage: UIImage? { get }
  var warningTitle: String { get }
  var warningDescription: String { get }
}

final class ProductsViewModel: ProductsViewModelable {
  // MARK: - Constants
  private enum Constants {
    static let title = "Products"
    static let image = "warning"
    static let warningTitle = "Coming Soon"
    static let warningDescription = "We are currently working in more features to offer the best experience"
  }
  
  var title: String {
    Constants.title
  }
  
  var warningImage: UIImage? {
    UIImage(named: Constants.image)
  }
  
  var warningTitle: String {
    Constants.warningTitle
  }
  
  var warningDescription: String {
    Constants.warningDescription
  }
}
