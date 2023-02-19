//
//  ProductsViewController.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

import UIKit

final class ProductsViewController: UIViewController {
  // MARK: - Constants
  private enum Constants {
    static let headerTop: CGFloat = 60
    static let warningTop: CGFloat = 32
    static let imageTop: CGFloat = 24
    static let labelLeading: CGFloat = 16
  }
  
  // MARK: - UI properties
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "SFProDisplay-Bold", size: 34)
    label.adjustsFontForContentSizeCategory = true
    label.textColor = ColorPalette.appWhite
    label.numberOfLines = 0
    label.text = viewModel.title
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var backgroundView: GradientView = {
    let view = GradientView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "productsbackground")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var warningView: WarningView = {
    let view = WarningView()
    view.setUpData(image: viewModel.warningImage, title: viewModel.warningTitle, description: viewModel.warningDescription)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Data properties
  private let viewModel: ProductsViewModelable
  
  // MARK: - Lifecycle
  init(viewModel: ProductsViewModelable) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buildView()
  }
}

extension ProductsViewController: ViewCodable {
  func buildViewHierarchy() {
    view.addSubviews(backgroundView, imageView, titleLabel, warningView)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      // Background View
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      // Image View
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      // Header View
      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.headerTop),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.labelLeading),
      
      // Warning View
      warningView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.warningTop),
      warningView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      warningView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      warningView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}
