//
//  ProfileVC.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 25/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//
import Photos
import UIKit

class ProfileVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var btnDropDown: GenderBtnDesign!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var otherBtn: UIButton!
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
   var occupation = ["Student","Goverment Job","Service","Doctor","Software Developer"]
    
    
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
           userImage.layer.borderWidth = 1.0
           userImage.layer.masksToBounds = false
            userImage.layer.borderColor = UIColor.white.cgColor
            userImage.layer.cornerRadius = userImage.frame.size.width/2
            userImage.clipsToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true
    self.navigationController?.isNavigationBarHidden = false

    }
    @IBAction func onDropDownTapped(_ sender: UIButton) {
        if tblView.isHidden {
            animate(toggle: true)
        }else {
            animate(toggle: false)
        }
    }
    
    func animate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = false
            }
        }else {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return occupation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = occupation[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnDropDown.setTitle("\(occupation[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
    
    @IBAction func maleBtnTapped(_ sender: UIButton) {
        if maleBtn.isSelected == false {
            btnSelection(button: maleBtn)
            notgenderSelected(button: femaleBtn)
            notgenderSelected(button: otherBtn)
        }else {
            notgenderSelected(button: maleBtn)
        }
    }
    
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.allowsEditing = true
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    
    @IBAction func cameraBtnTapped(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case.authorized:
                   self.presentPhotoPickerController()
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted" ,message: "Photo Photo Library access is restricted and cannot be accessed.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okAction)
                    self.present(alert,animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Access Denied", message: "Photo Library access was previously denied.Please update your settings if you wish to change this.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Go to Settings", style: .default) {(action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(okAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                @unknown default:
                    break
                }
            }
        }
        
    }
    
    
    
    @IBAction func female(_ sender: UIButton) {
        if femaleBtn.isSelected == false {
            btnSelection(button: femaleBtn)
            notgenderSelected(button: maleBtn)
            notgenderSelected(button: otherBtn)
        }else {
            notgenderSelected(button: femaleBtn)
        }
    }
    
    
    
    @IBAction func otherBtn(_ sender: UIButton) {
        if otherBtn.isSelected == false {
            btnSelection(button: otherBtn)
           notgenderSelected(button: maleBtn)
            notgenderSelected(button: femaleBtn)
        }else {
            notgenderSelected(button: otherBtn)
        }
    }
    
    
    
    
    
    
    //button selection function
    func btnSelection(button: UIButton) {
        button.isSelected = true
        button.backgroundColor = UIColor.white
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.backgroundColor = UIColor.clear
//        button.setTitleColor(UIColor.black, for: .disabled)
    }
    
    func notgenderSelected(button: UIButton) {
        button.isSelected = false
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.white, for: .normal)
    }
}


extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
        }else if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
}
