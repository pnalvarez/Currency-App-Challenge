//
//  CurrencyListView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

final class CurrencyListView: UIView {
  // MARK: - Constants
  private enum Constants {
    static let title = "Your currencies"
    static let viewAll = "View all"
    
    static let titleLabelTop: CGFloat = 20
    static let titleLabelLeading: CGFloat = 24
    static let viewAllButtonTrailing: CGFloat = -24
    static let tableViewTop: CGFloat = 16
    static let cornerRadius: CGFloat = 20
    static let tableViewHeight: CGFloat = 358
  }
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 17, weight: .bold)
    label.numberOfLines = 1
    label.textAlignment = .left
    label.text = Constants.title
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var viewAllButton: UIButton = {
    let button = UIButton()
    button.setTitle(Constants.viewAll, for: .normal)
    button.addTarget(self, action: #selector(didTapViewAll), for: .touchUpInside)
    button.setTitleColor(ColorPalette.appCyan, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false
    tableView.separatorStyle = .none
    tableView.registerCell(cellType: CurrencyListTableViewCell.self)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  private var currencies: [CurrencyViewModel]? {
    didSet {
      tableView.reloadData()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = ColorPalette.backgroundGrey
    applyMask()
    buildView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUpCurrencies(_ currencies: [CurrencyViewModel]) {
    self.currencies = currencies
  }
}

private extension CurrencyListView {
  @objc func didTapViewAll() {
    // TO DO
  }
  
  func applyMask() {
    clipsToBounds = true
    layer.cornerRadius = Constants.cornerRadius
    layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
}

extension CurrencyListView: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    currencies?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let currencies else {
      return UITableViewCell()
    }
    let cell = tableView.dequeueReusableCell(indexPath: indexPath, type: CurrencyListTableViewCell.self)
    let currency = currencies[indexPath.row]
    cell.setUpData(image: currency.image,
                   currencyCode: currency.code,
                   currencyName: currency.name,
                   balance: currency.balance)
    return cell
  }
}

extension CurrencyListView: ViewCodable {
  func buildViewHierarchy() {
    addSubviews(titleLabel, viewAllButton, tableView)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.titleLabelTop),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.titleLabelLeading),
      
      viewAllButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
      viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.viewAllButtonTrailing),
      
      tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.tableViewTop),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      tableView.heightAnchor.constraint(equalToConstant: Constants.tableViewHeight),
    ])
  }
}
