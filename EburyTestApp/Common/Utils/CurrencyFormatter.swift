//
//  CurrencyFormatter.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation

protocol CurrencyFormatting {
  func format(_ double: Double) -> String
}

final class CurrencyFormatter: CurrencyFormatting {
  private var numberFormatter: NumberFormatting
  
  init(numberFormatter: NumberFormatting = NumberFormatter()) {
    self.numberFormatter = numberFormatter
  }
  
  func format(_ double: Double) -> String {
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 2

    var formattedValue = numberFormatter.string(for: double) ?? ""
    formattedValue = formattedValue.replacingOccurrences(of: ".", with: "#")
    formattedValue = formattedValue.replacingOccurrences(of: ",", with: ".")
    formattedValue = formattedValue.replacingOccurrences(of: "#", with: ",")
    return formattedValue
  }
}
