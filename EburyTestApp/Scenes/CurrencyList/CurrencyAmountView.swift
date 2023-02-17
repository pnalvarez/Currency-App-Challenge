//
//  CurrencyAmountView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

final class CurrencyAmountView: UIView {
  // MARK: - Constants
  private enum Constants {
    static let currencyStackTop: CGFloat = 16
    static let currencyStackLeading: CGFloat = 8
    static let currencyStackSpacing: CGFloat = 4
    static let currencyStackBotton: CGFloat = -16
    static let flagImageViewHeight: CGFloat = 32
    static let flagImageViewWidth: CGFloat = 32
    static let flagImageViewLeading: CGFloat = 16
    static let balanceLabelTrailing: CGFloat = -16
    static let cornerRadius: CGFloat = 8
  }
  
  // MARK: - ViewModel
  struct ViewModel {
    let image: UIImage?
    let currencyCode: String
    let currencyName: String
    let balance: String
  }
  
  private lazy var containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var flagImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var currencyStackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = Constants.currencyStackSpacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  private lazy var currencyCodeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "SFProDisplay-Bold", size: 17)
    label.textAlignment = .left
    label.numberOfLines = 1
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var currencyNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "SFProText-Regular", size: 15)
    label.textAlignment = .left
    label.textColor = ColorPalette.appGrey
    label.numberOfLines = 1
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var balanceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "SFProDisplay-Bold", size: 20)
    label.numberOfLines = 1
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .right
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    containerView.layer.cornerRadius = Constants.cornerRadius
    containerView.layer.shadowColor = UIColor.black.cgColor
    containerView.layer.shadowOpacity = 0.2
    containerView.layer.shadowOffset = CGSize(width: 0, height: 6)
    containerView.layer.shadowRadius = 8
    containerView.layer.shouldRasterize = true
    containerView.layer.rasterizationScale = UIScreen.main.scale
    containerView.backgroundColor = .white
    buildView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    flagImageView.layer.cornerRadius = flagImageView.frame.width / 2
  }
  
  func setUpViewModel(_ viewModel: ViewModel) {
    flagImageView.image = viewModel.image
    currencyCodeLabel.text = viewModel.currencyCode
    currencyNameLabel.text = viewModel.currencyName
    balanceLabel.text = viewModel.balance
  }
}

extension CurrencyAmountView: ViewCodable {
  func buildViewHierarchy() {
    addSubview(containerView)
    containerView.addSubviews(flagImageView,
                              currencyStackView,
                              balanceLabel)
    currencyStackView.addArrangedSubviews(currencyCodeLabel,
                                          currencyNameLabel)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: topAnchor),
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      flagImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.flagImageViewLeading),
      flagImageView.heightAnchor.constraint(equalToConstant: Constants.flagImageViewHeight),
      flagImageView.widthAnchor.constraint(equalToConstant: Constants.flagImageViewWidth),
      flagImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      
      currencyStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.currencyStackTop),
      currencyStackView.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: Constants.currencyStackLeading),
      currencyStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.currencyStackBotton),
      
      balanceLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      balanceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.balanceLabelTrailing),
    ])
  }
}
