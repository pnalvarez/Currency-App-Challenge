//
//  TestViewController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit
import Combine

final class CurrencyListViewController: UIViewController {
  // MARK: - Constants for constraints
  private enum Constants {
    static let currencyListTop: CGFloat = 88
    static let profileButtonTop: CGFloat = 8
    static let profileButtonLeading: CGFloat = 16
    static let loadingViewTop: CGFloat = 32
    static let headerViewTop: CGFloat = 12
    static let imageViewTop: CGFloat = 24
  }
  
  // MARK: - UI properties
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
    view.setupData(title: viewModel.headerTitle)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "background")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var currencyListView: CurrencyListView = {
    let view = CurrencyListView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Data Properties
  
  private let viewModel: CurrencyListViewModelable
  
  //To save the Combine subscriptions in memory
  private lazy var subscriptions: Set<AnyCancellable> = .init()
  
  // MARK: - Lifecycke
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

// MARK: - Private methods
private extension CurrencyListViewController {
  func setupSubscribers() {
    viewModel
      .currencyListDataPublisher
      .sink(receiveValue: { [weak self] value in
        guard let self else { return }
        self.headerView.setupData(title: self.viewModel.headerTitle,
                                  subtitle: value.companyName)
        self.currencyListView.setUpCurrencies(value.currencies)
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
    alert.addAction(.init(title: viewModel.okText, style: .default))
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

// MARK: - View Code pipeline implementation
extension CurrencyListViewController: ViewCodable {
  func buildViewHierarchy() {
    view.addSubviews(backgroundView,
                     imageView,
                     profileButton,
                     loadingView,
                     headerView,
                     currencyListView)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      // BACKGROUND VIEW
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      // PROFILE BUTTON
      profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.profileButtonTop),
      profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.profileButtonLeading),
      
      // LOADING VIEW
      loadingView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: Constants.loadingViewTop),
      loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      // HEADER VIEW
      headerView.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: Constants.headerViewTop),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      // IMAGE VIEW
      imageView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: Constants.imageViewTop),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      // CURRENCY LIST VIEW
      currencyListView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Constants.currencyListTop),
      currencyListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      currencyListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      currencyListView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
}
