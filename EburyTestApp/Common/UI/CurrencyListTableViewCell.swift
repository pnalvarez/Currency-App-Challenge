//
//  CurrencyListTableViewCell.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

final class CurrencyListTableViewCell: UITableViewCell {
  private enum Constants {
    static let viewTop: CGFloat = 8
    static let viewBottom: CGFloat = -8
    static let viewLeading: CGFloat = 16
    static let viewTrailing: CGFloat = -16
  }
  
  private lazy var currencyAmountView: CurrencyAmountView = {
    let view = CurrencyAmountView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    buildView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUpData(image: UIImage?,
                 currencyCode: String,
                 currencyName: String,
                 balance: String) {
    currencyAmountView.setUpViewModel(.init(image: image,
                                            currencyCode: currencyCode,
                                            currencyName: currencyName,
                                            balance: balance))
  }
}

extension CurrencyListTableViewCell: ViewCodable {
  func buildViewHierarchy() {
    addSubview(currencyAmountView)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      currencyAmountView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.viewTop),
      currencyAmountView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.viewLeading),
      currencyAmountView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.viewTrailing),
      currencyAmountView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.viewBottom),
    ])
  }
}
