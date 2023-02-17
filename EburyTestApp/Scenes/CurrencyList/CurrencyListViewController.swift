//
//  TestViewController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

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
    view.setupData(title: "Welcome", subtitle: "Company name")
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
    view.setUpCurrencies([.init(currency: .usd, balance: "50.000,25"), .init(currency: .eur, balance: "50.000,25"), .init(currency: .gbp, balance: "50.000,25"), .init(currency: .brl, balance: "50.000,25"), .init(currency: .cny, balance: "50.000,25")])
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buildView()
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
