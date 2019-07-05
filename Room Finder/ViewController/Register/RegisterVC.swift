//
//  RegisterVC.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 25/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC {
            present(loginViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
}
