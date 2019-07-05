//
//  LoginVC.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 25/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let registerView = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC {
            present(registerView, animated: true, completion: nil)
           
        }
    }
    
    @IBAction func forgotBtnTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let forgotVc = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC {
            present(forgotVc, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let profileVc = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC {
            present(profileVc, animated: true, completion: nil)
        }
    }
    
    
}
