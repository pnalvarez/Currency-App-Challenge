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
  }
  
  // MARK: - UI properties
  private lazy var headerView: HeaderView = {
    let view = HeaderView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setupData(title: viewModel.title)
    return view
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
    view.addSubviews(backgroundView, imageView, headerView, warningView)
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.headerTop),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      warningView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Constants.warningTop),
      warningView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      warningView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      warningView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}
