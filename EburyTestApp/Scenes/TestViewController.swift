//
//  TestViewController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

class TestViewController: UIViewController {
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
    view.backgroundColor = .white
    view.addSubview(imageView)
    view.addSubview(testView)
    NSLayoutConstraint.activate([
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
