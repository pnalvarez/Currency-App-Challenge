//
//  ProductsFactory.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

enum ProductsFactory {
  static func build() -> ProductsViewController {
    ProductsViewController(viewModel: ProductsViewModel())
  }
}
