//
//  TestViewController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

class TestViewController: UIViewController {
  private lazy var testView: CurrencyAmountView = {
    let view = CurrencyAmountView()
    view.setUpViewModel(.init(image: UIImage(named: "usaflag"), currencyCode: "USA", currencyName: "US Dollars", balance: "50,000,50"))
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(testView)
    NSLayoutConstraint.activate([
      testView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      testView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      testView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
    ])
  }
}
