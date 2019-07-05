//
//  aboutselfDesign.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 26/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

@IBDesignable
class aboutselfDesign: UITextView {

    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
