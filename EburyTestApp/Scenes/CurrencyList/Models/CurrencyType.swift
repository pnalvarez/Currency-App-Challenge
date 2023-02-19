//
//  CurrencyType.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

enum CurrencyType: String {
  case usd = "USD"
  case eur = "EUR"
  case gbp = "GBP"
  case brl = "BRL"
  case cny = "CNY"
  
  var name: String {
    switch self {
    case .usd:
      return "US Dollars"
    case .eur:
      return "Euro"
    case .gbp:
      return "British Pound"
    case .brl:
      return "Brazilian Reais"
    case .cny:
      return "Chinese Yuan"
    }
  }
  
  var image: UIImage? {
    switch self {
    case .usd:
      return UIImage(named: "usaflag")
    case .eur:
      return UIImage(named: "euroflag")
    case .gbp:
      return UIImage(named: "ukflag")
    case .brl:
      return UIImage(named: "brazilflag")
    case .cny:
      return UIImage(named: "chinaflag")
    }
  }
}
