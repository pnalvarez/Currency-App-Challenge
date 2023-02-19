//
//  CurrencyFormatterTests.swift
//  EburyTestAppTests
//
//  Created by Pedro Alvarez on 19/02/23.
//

import XCTest
@testable import EburyTestApp

class CurrencyFormatterTests: XCTestCase {
  var sut: CurrencyFormatter?
  
  func testFormat() {
    // Given
    let mock = NumberFormatterMock()
    // When
    sut = CurrencyFormatter(numberFormatter: mock)
    // Then
    let formatted = sut?.format(50.000)
    XCTAssertEqual(formatted, "50,000.00")
  }
}
