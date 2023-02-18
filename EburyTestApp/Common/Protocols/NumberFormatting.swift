//
//  NumberFormatting.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation

//Protocol for improving dependency injection of NumberFormatter
protocol NumberFormatting {
  var numberStyle: NumberFormatter.Style { get set }
  var maximumFractionDigits: Int { get set }
  func string(for object: Any?) -> String?
}

//With it, we can inject a mock of NumberFormatter instead of concrete type and have unit tests
extension NumberFormatter: NumberFormatting { }
