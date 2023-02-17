//
//  ReusableView.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 16/02/23.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? String(describing: Mirror(reflecting: self).subjectType)
    }
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }
