//
//  BtnDesign.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 25/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

@IBDesignable
class BtnDesign: UIButton {

    @IBInspectable public var cornorRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornorRadius
        }
    }
}
