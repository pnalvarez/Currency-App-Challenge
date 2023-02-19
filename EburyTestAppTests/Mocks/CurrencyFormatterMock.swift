//
//  CurrencyFormatterMock.swift
//  EburyTestAppTests
//
//  Created by Pedro Alvarez on 19/02/23.
//

import Foundation
@testable import EburyTestApp

final class CurrencyFormatterMock: CurrencyFormatting {
  var returnedValue: String?
  
  func format(_ double: Double) -> String {
    returnedValue ?? ""
  }
}
