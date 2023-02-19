//
//  NumberFormatterMock.swift
//  EburyTestAppTests
//
//  Created by Pedro Alvarez on 19/02/23.
//

@testable import EburyTestApp
import Foundation

final class NumberFormatterMock: NumberFormatting {
  var numberStyle: NumberFormatter.Style = .decimal
  
  var maximumFractionDigits: Int = 2
  
  func string(for object: Any?) -> String? {
    "50.000,00"
  }
}
