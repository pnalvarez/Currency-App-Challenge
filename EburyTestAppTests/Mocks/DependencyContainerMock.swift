//
//  DependencyContainerMock.swift
//  EburyTestAppTests
//
//  Created by Pedro Alvarez on 19/02/23.
//

@testable import EburyTestApp
import Foundation

final class DependencyContainerMock: HasDecoder, HasCurrencyFormatter {
  lazy var jsonDecoder: JSONDecoder = JSONDecoder()
  lazy var currencyFormatter: CurrencyFormatting = CurrencyFormatterMock()
}
