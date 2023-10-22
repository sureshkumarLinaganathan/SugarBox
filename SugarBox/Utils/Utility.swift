//
//  Utility.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

extension UITableViewCell {
    public class var identifier: String {
        return String(describing: self)
    }
}
extension UICollectionViewCell {
    public class var identifier: String {
        return String(describing: self)
    }
}

