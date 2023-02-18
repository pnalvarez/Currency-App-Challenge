//
//  CurrencyViewModel.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

struct CurrencyDisplayModel {
  let currency: CurrencyType
  let balance: String
  
  init?(input: AmountModel) {
    guard let currency = CurrencyType(rawValue: input.currency) else {
      return nil
    }
    self.currency = currency
    self.balance = CurrencyFormatter().format(Double(input.amount) ?? 0.0)
  }
}
