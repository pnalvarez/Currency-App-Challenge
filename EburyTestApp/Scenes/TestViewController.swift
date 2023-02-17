//
//  TestViewController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

class TestViewController: UIViewController {
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
  
  private lazy var testView: CurrencyListView = {
    let view = CurrencyListView()
    view.setUpCurrencies([.init(image: UIImage(named: "usaflag"), code: "USD", name: "US Dollars", balance: "50,000.50"), .init(image: UIImage(named: "euroflag"), code: "EUR", name: "Euro", balance: "8,000.00"), .init(image: UIImage(named: "ukflag"), code: "GBP", name: "British Pounds", balance: "20,000.00")])
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBarItem = UITabBarItem(title: "Home", image: <#T##UIImage?#>, tag: <#T##Int#>)
    view.backgroundColor = .white
    view.addSubview(imageView)
    view.addSubview(profileButton)
    view.addSubview(loadingView)
    view.addSubview(headerView)
    view.addSubview(testView)
    NSLayoutConstraint.activate([
      profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      
      loadingView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 32),
      loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      headerView.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 12),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      testView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      testView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      testView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
}
