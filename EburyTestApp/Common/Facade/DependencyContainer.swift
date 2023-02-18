//
//  DependencyContainer.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation

protocol HasDecoder {
  var jsonDecoder: JSONDecoder { get }
}

protocol HasNumberFormatter {
  var numberFormatter: NumberFormatting { get set }
}

/* The Facade design pattern is used here to hold all dependencies the module or application may need in order to be injected in a class. For this simple project, we only rely on the JSONDecoder, but for complex ones, having a protocol to hold each one and inject the container implementing only the desired dependencies protocols is very useful and decreases coupling and complexity */

final class DependencyContainer: HasDecoder, HasNumberFormatter {
  lazy var jsonDecoder: JSONDecoder = JSONDecoder()
  lazy var numberFormatter: NumberFormatting = NumberFormatter()
}
