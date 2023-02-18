//
//  TestViewController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit
import Combine

final class CurrencyListViewController: UIViewController {
  private lazy var backgroundView: GradientView = {
    let view = GradientView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var profileButton: ProfileButton = {
    let button = ProfileButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var loadingView: ActivityView = {
    let view = ActivityView()
    view.startAnimating()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var headerView: HeaderView = {
    let view = HeaderView()
    view.setupData(title: "Welcome")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "background")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var currencyView: CurrencyListView = {
    let view = CurrencyListView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let viewModel: CurrencyListViewModelable
  
  private lazy var subscriptions: Set<AnyCancellable> = .init()
  
  init(viewModel: CurrencyListViewModelable) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
    buildView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubscribers()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.viewWillAppear()
  }
}

private extension CurrencyListViewController {
  func setupSubscribers() {
    viewModel
      .currencyListDataPublisher
      .sink(receiveValue: { [weak self] value in
        guard let self else { return }
        self.headerView.setupData(title: self.viewModel.headerTitle,
                                  subtitle: value.companyName)
        self.currencyView.setUpCurrencies(value.currencies)
    })
      .store(in: &subscriptions)
    viewModel
      .errorPublisher
      .sink(receiveValue: { [weak self] value in
        guard let self else { return }
        self.presentErrorAlert(value)
    })
      .store(in: &subscriptions)
    viewModel
      .loadingPublisher
      .sink(receiveValue: { [weak self] value in
        guard let self else { return }
        value ? self.startLoading() : self.stopLoading()
      })
      .store(in: &subscriptions)
  }
  
  func presentErrorAlert(_ description: String) {
    let alert = UIAlertController(title: viewModel.errorTitle, message: description, preferredStyle: .alert)
    alert.addAction(.init(title: "Ok", style: .default))
    present(alert, animated: true)
  }
  
  func startLoading() {
    loadingView.startAnimating()
    loadingView.isHidden = false
  }
  
  func stopLoading() {
    loadingView.stopAnimating()
  }
}

extension CurrencyListViewController: ViewCodable {
  func buildViewHierarchy() {
    view.addSubviews(backgroundView,
                     imageView,
                     profileButton,
                     loadingView,
                     headerView,
                     currencyView)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      
      loadingView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 32),
      loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      headerView.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 12),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      imageView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 24),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      currencyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      currencyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      currencyView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
}
