//
//  WarningView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class WarningView: UIView {
  // MARK: - Constants
  private enum Constants {
    static let titleTop: CGFloat = 32
    static let descriptionTop: CGFloat = 8
    static let cornerRadius: CGFloat = 20
    static let leading: CGFloat = 32
    static let trailing: CGFloat = -32
    static let imageHeight: CGFloat = 186
    static let imageWidth: CGFloat = 236
  }
  
  // MARK: - UI properties
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var imageContainer: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "SFProDisplay-Regular", size: 22)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "SFProText-Regular", size: 17)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = ColorPalette.appGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = Constants.descriptionTop
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.alignment = .center
    return stack
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = ColorPalette.backgroundGray
    applyMask()
    buildView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUpData(image: UIImage?, title: String, description: String) {
    imageView.image = image
    titleLabel.text = title
    descriptionLabel.text = description
  }
}

private extension WarningView {
  func applyMask() {
    clipsToBounds = true
    layer.cornerRadius = Constants.cornerRadius
    layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
}

extension WarningView: ViewCodable {
  func buildViewHierarchy() {
    addSubview(stackView)
    stackView.addArrangedSubviews(imageView, titleLabel, descriptionLabel)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: Constants.leading),
      stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: Constants.trailing),
      
      imageView.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
      imageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
    ])
  }
  
  func configureViews() {
    stackView.setCustomSpacing(Constants.titleTop, after: imageView)
  }
}
