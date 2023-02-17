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
    
    static let titleLabelTop: CGFloat = 40
    static let titleLabelLeading: CGFloat = 24
    static let viewAllButtonTrailing: CGFloat = -24
    static let tableViewTop: CGFloat = 16
    static let cornerRadius: CGFloat = 20
    static let tableViewHeight: CGFloat = 358
    static let tableViewBottom: CGFloat = -16
  }
  
  private lazy var containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = ColorPalette.backgroundGray
    return view
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
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
    button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false
    tableView.separatorStyle = .none
    tableView.backgroundColor = ColorPalette.backgroundGray
    tableView.registerCell(cellType: CurrencyListTableViewCell.self)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  private var currencies: [CurrencyDisplayModel]? {
    didSet {
      tableView.reloadData()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layer.cornerRadius = Constants.cornerRadius
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.2
    layer.shadowOffset = CGSize(width: 6, height: -200)
    layer.shadowRadius = 8
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
    applyMask()
    buildView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUpCurrencies(_ currencies: [CurrencyDisplayModel]) {
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
    let model = currencies[indexPath.row]
    cell.setUpData(image: model.currency.image,
                   currencyCode: model.currency.rawValue,
                   currencyName: model.currency.name,
                   balance: model.balance)
    return cell
  }
}

extension CurrencyListView: ViewCodable {
  func buildViewHierarchy() {
    addSubviews(containerView)
    containerView.addSubviews(titleLabel, viewAllButton, tableView)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: topAnchor),
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.titleLabelTop),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.titleLabelLeading),
      
      viewAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
      viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.viewAllButtonTrailing),
      
      tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.tableViewTop),
      tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.tableViewBottom),
      tableView.heightAnchor.constraint(equalToConstant: Constants.tableViewHeight),
    ])
  }
}
