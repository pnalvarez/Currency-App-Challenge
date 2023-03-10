//
//  CurrencyListViewModel.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import Combine

// MARK: - CurrencyListViewModelable
// Interface for ViewModel
protocol CurrencyListViewModelable {
  var currencyListDataPublisher: AnyPublisher<CurrencyListDisplayModel, Never> { get }
  var errorPublisher: AnyPublisher<String, Never> { get }
  var loadingPublisher: AnyPublisher<Bool, Never> { get }
  var headerTitle: String { get }
  var errorTitle: String { get }
  var okText: String { get }
  var backgroundImageText: String { get }
  func viewWillAppear()
}

// MARK: - CurrencyListModel
// Concrete type
final class CurrencyListViewModel: CurrencyListViewModelable {
  // MARK: - Needed dependencies
  typealias Dependencies = HasCurrencyFormatter
 // MARK: Constants
  private enum Constants {
    static let headerTitle = "Welcome"
    static let errorTitle = "You got an error"
    static let okText = "Ok"
    static let backgroundImage = "background"
  }
  
  // MARK: Data properties
  private let service: CurrencyListServicing
  private let dependencies: Dependencies
  
  // Subjects to send data to ViewController, who subscribes to them
  private lazy var currencyListDataSubject: PassthroughSubject<CurrencyListDisplayModel, Never> = .init()
  private lazy var errorSubject: PassthroughSubject<String, Never> = .init()
  private lazy var loadingSubject: PassthroughSubject<Bool, Never> = .init()
  
  // To save the subscription to the Service publisher in memory
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
  
  var backgroundImageText: String {
    Constants.backgroundImage
  }
  
  // MARK: - Lifecyle
  init(service: CurrencyListServicing = CurrencyListService(),
       dependencies: Dependencies = DependencyContainer()) {
    self.service = service
    self.dependencies = dependencies
  }
  
  func viewWillAppear() {
    loadingSubject.send(true)
    subscription = service
    // Fetches currency list from Service
      .fetchCurrencyList()
    // Maps to Display Model, which is more suitable format to the screen having information like the image
      .map(mapModelToDisplayModel)
    // Subscriber
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

private extension CurrencyListViewModel {
  func mapModelToDisplayModel(_ model: CurrencyListModel) -> CurrencyListDisplayModel {
    let amounts = model.amount
    var displayAmounts = [CurrencyDisplayModel]()
    for amountModel in amounts {
      if let currencyType = CurrencyType(rawValue: amountModel.currency) {
        displayAmounts.append(CurrencyDisplayModel(currency: currencyType,
                                                   balance: formatCurrencyAmount(amountModel.amount)))
      }
    }
    let output = CurrencyListDisplayModel(companyName: model.companyName,
                                          currencies: displayAmounts)
    return output
  }
  
  func formatCurrencyAmount(_ amount: String) -> String {
    let double = Double(amount) ?? 0
    let formatted = dependencies.currencyFormatter.format(double)
    return formatted
  }
}

