//
//  UIView+Extensions.swift
//  payconiq
//
//  Created by Asif Junaid on 11/29/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//
import UIKit

extension UIView {
    func dropShadow(_ color: UIColor) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath

    }
}
