//
//  CurrencyListViewModel.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import Combine

protocol CurrencyListViewModelable {
  var currencyListDataPublisher: AnyPublisher<CurrencyListDisplayModel, Never> { get }
  var errorPublisher: AnyPublisher<String, Never> { get }
  var loadingPublisher: AnyPublisher<Bool, Never> { get }
  var headerTitle: String { get }
  var errorTitle: String { get }
  var okText: String { get }
  func viewWillAppear()
}

final class CurrencyListViewModel: CurrencyListViewModelable {
  // MARK: Constants
  private enum Constants {
    static let headerTitle = "Welcome"
    static let errorTitle = "You got an error"
    static let okText = "Ok"
  }
  
  // MARK: Data properties
  private let service: CurrencyListServicing
  
  private lazy var currencyListDataSubject: PassthroughSubject<CurrencyListDisplayModel, Never> = .init()
  private lazy var errorSubject: PassthroughSubject<String, Never> = .init()
  private lazy var loadingSubject: PassthroughSubject<Bool, Never> = .init()
  
  private var subscription: AnyCancellable?
  
  var currencyListDataPublisher: AnyPublisher<CurrencyListDisplayModel, Never> {
    currencyListDataSubject.eraseToAnyPublisher()
  }
  
  var errorPublisher: AnyPublisher<String, Never> {
    errorSubject.eraseToAnyPublisher()
  }
  
  var loadingPublisher: AnyPublisher<Bool, Never> {
    loadingSubject.eraseToAnyPublisher()
  }
  
  var headerTitle: String {
    Constants.headerTitle
  }
  
  var errorTitle: String {
    Constants.errorTitle
  }
  
  var okText: String {
    Constants.okText
  }
  
  init(service: CurrencyListServicing = CurrencyListService()) {
    self.service = service
  }
  
  func viewWillAppear() {
    loadingSubject.send(true)
    subscription = service
      .fetchCurrencyList()
      .map({ CurrencyListDisplayModel(companyName: $0.companyName,
                                      currencies: $0.amount.compactMap({ CurrencyDisplayModel(input: $0) }))})
    
      .sink(receiveCompletion: { [weak self] completion in
        guard let self else { return }
        self.loadingSubject.send(false)
        if case let .failure(err) = completion {
          self.errorSubject.send(err.localizedDescription)
        }
      }, receiveValue: { [weak self] value in
        guard let self else { return }
        self.loadingSubject.send(false)
        self.currencyListDataSubject.send(value)
      })
  }
}
