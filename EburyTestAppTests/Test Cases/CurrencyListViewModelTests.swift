//
//  CurrencyListViewModelTests.swift
//  EburyTestAppTests
//
//  Created by Pedro Alvarez on 19/02/23.
//

import Foundation
import XCTest
import Combine
@testable import EburyTestApp

final class CurrencyViewModelTests: XCTestCase {
  var sut: CurrencyListViewModel?
  
  private var subscription: AnyCancellable?
  
  func testViewWillAppear_WhenAPIIsWorking_ShouldReturnCurrencyList() {
    sut = CurrencyListViewModel(service: CurrencyListServiceMock(isSuccess: true))
    subscription = sut?
      .currencyListDataPublisher
      .sink(receiveValue: { value in
        XCTAssertEqual(value.companyName, "Company Name")
        XCTAssertEqual(value.currencies, [.init(currency: .usd, balance: "300.25")])
    })
    sut?.viewWillAppear()
  }
}
