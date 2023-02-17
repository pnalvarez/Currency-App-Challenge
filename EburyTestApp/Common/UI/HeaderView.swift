//
//  HeaderView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class HeaderView: UIView {
  // MARK: - Constants
  private enum Constants {
    static let stackSpacing: CGFloat = 8
    static let stackLeading: CGFloat = 16
  }
  
  // MARK: - UI Properties
  private lazy var stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = Constants.stackSpacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 34, weight: .bold)
    label.textColor = ColorPalette.appWhite
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 17, weight: .bold)
    label.textColor = ColorPalette.appWhite
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    buildView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupData(title: String, subtitle: String? = nil) {
    titleLabel.text = title
    subtitleLabel.text = subtitle
  }
}

extension HeaderView: ViewCodable {
  func buildViewHierarchy() {
    addSubview(stackView)
    stackView.addArrangedSubviews(titleLabel, subtitleLabel)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.stackLeading),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
}
