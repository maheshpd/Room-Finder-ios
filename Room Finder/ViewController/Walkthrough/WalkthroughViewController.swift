//
//  WalkthroughViewController.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 19/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController ,WalkthroughPageViewControllerDelegate {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var NextBtn: UIButton!
    @IBOutlet var prevBtn: UIButton!
    
    
    //MARK: - properties
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        update()
    }
    
    func update() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                prevBtn.isHidden = true
                break
            case 1...2:
                prevBtn.isHidden = false
                break
            case 2...3:
                prevBtn.isHidden = false
                break
            case 3...4:
                prevBtn.isHidden = false
                break
            default: break
            }
            pageControl.currentPage = index
        }
    }
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
               walkthroughPageViewController?.forwardPage()
               break
            case 1...2:
               walkthroughPageViewController?.forwardPage()
               break
            case 2...3:
                 walkthroughPageViewController?.forwardPage()
                break
            case 3...4:
                walkthroughPageViewController?.forwardPage()
                login()
                break
            default: break
            }
        }
        update()
    }
    
    func login() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let loginview = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC {
            present(loginview, animated: true, completion: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    
    @IBAction func prevBtnTapped(_ sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.backwardPage()
                break
            case 1...2:
                walkthroughPageViewController?.backwardPage()
                break
            case 2...3:
                walkthroughPageViewController?.backwardPage()
                break
            case 3...4:
                walkthroughPageViewController?.backwardPage()
                break
            default: break
                
            }
        }
        update()
    }
    
    
}
