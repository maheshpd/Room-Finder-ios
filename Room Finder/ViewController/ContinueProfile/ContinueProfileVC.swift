//
//  ContinueProfileVC.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 26/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

class ContinueProfileVC: UIViewController {

    @IBOutlet weak var vegetarianBtn: UIButton!
    @IBOutlet weak var nonVegtarian: UIButton!
    @IBOutlet weak var nonSmoker: UIButton!
    @IBOutlet weak var smoker: UIButton!
    @IBOutlet weak var nonDrink: UIButton!
    @IBOutlet weak var drink: UIButton!
    @IBOutlet weak var clean: UIButton!
    @IBOutlet weak var average: UIButton!
    @IBOutlet weak var messy: UIButton!
    
    @IBOutlet weak var update: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backBtnTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //button selection function
    func btnSelection(button: UIButton) {
        button.isSelected = true
        button.backgroundColor = UIColor.white
        button.titleLabel?.backgroundColor = UIColor.clear
        button.setTitleColor(.black, for: .normal)
        //        button.setTitleColor(.black, for: .normal)
        //        button.titleLabel?.backgroundColor = UIColor.clear
        //        button.setTitleColor(UIColor.black, for: .disabled)
    }
    
    func notBtnSelected(button: UIButton) {
        button.isSelected = false
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func vegBtnTapped(_ sender: UIButton) {
        if vegetarianBtn.isSelected == false {
            btnSelection(button: vegetarianBtn)
            notBtnSelected(button: nonVegtarian)
            print("Veg")
        }else {
            notBtnSelected(button: nonVegtarian)
        }
    }
    
    @IBAction func nonVegBtnTapped(_ sender: UIButton) {
        if nonVegtarian.isSelected == false {
            btnSelection(button: nonVegtarian)
            notBtnSelected(button: vegetarianBtn)
            print("non Veg")
        }else {
            notBtnSelected(button: nonVegtarian)
        }
    }
    @IBAction func nonSmokerBtnTapped(_ sender: UIButton) {
        if nonSmoker.isSelected == false {
            btnSelection(button: nonSmoker)
            notBtnSelected(button: smoker)
        }else {
            notBtnSelected(button: smoker)
        }
    }
    @IBAction func smokerBtnTapped(_ sender: UIButton) {
        if smoker.isSelected == false {
            btnSelection(button: smoker)
            notBtnSelected(button: nonSmoker)
        }else {
            notBtnSelected(button: nonSmoker)
        }
    }
    
    @IBAction func nonDrinkBtnTapped(_ sender: UIButton) {
        if nonDrink.isSelected == false {
            btnSelection(button: nonDrink)
            notBtnSelected(button: drink)
        }else {
            notBtnSelected(button: drink)
        }
    }
    
    @IBAction func drinkBtnTapped(_ sender: UIButton) {
        if drink.isSelected == false {
            btnSelection(button: drink)
            notBtnSelected(button: nonDrink)
        }else {
            notBtnSelected(button: nonDrink)
        }
    }
    
    @IBAction func cleanBtnTapped(_ sender: UIButton) {
        if clean.isSelected == false {
            btnSelection(button: clean)
            notBtnSelected(button: average)
            notBtnSelected(button: messy)
        }else {
            notBtnSelected(button: clean)
        }
    }
    
    @IBAction func averageBtnTapped(_ sender: UIButton) {
        if average.isSelected == false {
            btnSelection(button: average)
            notBtnSelected(button: clean)
            notBtnSelected(button: messy)
        }else {
            notBtnSelected(button: average)
        }
    }
    @IBAction func messyBtnTapped(_ sender: UIButton) {
        if messy.isSelected == false {
            btnSelection(button: messy)
            notBtnSelected(button: clean)
            notBtnSelected(button: average)
        }else {
            notBtnSelected(button: messy)
        }
    }
    
    
}
