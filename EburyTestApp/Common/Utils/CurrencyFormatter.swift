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
  typealias Dependencies = HasNumberFormatter
  
  private var dependencies: Dependencies
  
  init(dependencies: Dependencies = DependencyContainer()) {
    self.dependencies = dependencies
  }
  
  func format(_ double: Double) -> String {
    dependencies.numberFormatter.numberStyle = .decimal
    dependencies.numberFormatter.maximumFractionDigits = 2

    var formattedValue = dependencies.numberFormatter.string(for: double) ?? ""
    formattedValue = formattedValue.replacingOccurrences(of: ".", with: "#")
    formattedValue = formattedValue.replacingOccurrences(of: ",", with: ".")
    formattedValue = formattedValue.replacingOccurrences(of: "#", with: ",")
    return formattedValue
  }
}
