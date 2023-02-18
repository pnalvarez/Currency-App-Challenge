//
//  CurrencyService.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation
import Combine

protocol CurrencyListServicing {
  func fetchCurrencyList() -> AnyPublisher<CurrencyListModel, Error>
}

final class CurrencyListService: CurrencyListServicing {
  func fetchCurrencyList() -> AnyPublisher<CurrencyListModel, Error> {
    API<CurrencyListModel>()
      .fetchData(WalletEndpoint.walletCheck)
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
