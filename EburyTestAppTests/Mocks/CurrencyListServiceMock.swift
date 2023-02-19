//
//  CurrencyListServiceMock.swift
//  EburyTestAppTests
//
//  Created by Pedro Alvarez on 19/02/23.
//

import Foundation
import Combine
@testable import EburyTestApp

final class CurrencyListServiceMock: CurrencyListServicing {
  private let isSuccess: Bool
  
  init(isSuccess: Bool) {
    self.isSuccess = isSuccess
  }
  
  func fetchCurrencyList() -> AnyPublisher<EburyTestApp.CurrencyListModel, Error> {
    if isSuccess {
      return Just(CurrencyListModel(accountId: "1234",
                                    companyName: "Company Name",
                                    amount: [.init(amount: "300.25",
                                                   currency: "USD",
                                                   indicator: "Credit")],
                                    dateTime: "2022-08-08T15:44:45.294"))
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
    } else {
      let anyError = NSError(domain: "domain", code: 123, userInfo: nil)
      return Fail<CurrencyListModel, Error>(error: anyError).eraseToAnyPublisher()
    }
  }
}
