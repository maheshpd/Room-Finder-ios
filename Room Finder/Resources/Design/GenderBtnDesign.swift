//
//  GenderBtnDesign.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 25/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

@IBDesignable
class GenderBtnDesign: UIButton {

    @IBInspectable public var cornorradius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornorradius
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
   
}
