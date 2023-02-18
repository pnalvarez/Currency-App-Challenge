//
//  CurrencyListFactory.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

enum CurrencyListFactory {
  static func build() -> CurrencyListViewController {
    CurrencyListViewController(viewModel: CurrencyListViewModel())
  }
}
