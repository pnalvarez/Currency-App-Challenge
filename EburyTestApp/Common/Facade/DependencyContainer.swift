//
//  DependencyContainer.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation

// Protocol for accessing JSONDecoder dependency
protocol HasDecoder {
  var jsonDecoder: JSONDecoder { get }
}

// Protocol for accessing CurrencyFormatter dependency
protocol HasCurrencyFormatter {
  var currencyFormatter: CurrencyFormatting { get }
}

/* The Facade design pattern is used here to hold all dependencies the module or application may need in order to be injected in a class. For this simple project, we only rely on the JSONDecoder, but for complex ones, having a protocol to hold each one and inject the container implementing only the desired dependencies protocols is very useful and decreases coupling and complexity */

final class DependencyContainer: HasDecoder, HasCurrencyFormatter {
  lazy var jsonDecoder: JSONDecoder = JSONDecoder()
  lazy var currencyFormatter: CurrencyFormatting = CurrencyFormatter()
}
