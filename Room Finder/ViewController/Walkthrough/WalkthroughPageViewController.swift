//
//  WalkthroughPageViewController.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 19/06/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    //MAKE: - Properties
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    
    //Make: Properties
    var pageHeading = ["Find your perfect room","Get every details","Instantly book","Wishlist"]
    var pageImages = ["icon_one","icon_two","icon_third","icon_four"]
    var pageSubHeadings = ["by location,room-type, price..etc","real pictures, real amenities",
                           "the room of your choice","easily track roomes you're interested in"]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //Set the data source and the delegate to itself
        dataSource = self
        delegate = self
        
        //Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    //MAKE: Helper
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageImages.count {
            return nil
        }
        
        //create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeading[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func backwardPage() {
        currentIndex -= 1
        if let previousController = contentViewController(at: currentIndex) {
            setViewControllers([previousController], direction: .reverse, animated: true, completion: nil)
        }
    }
    
    //MAKE: - Page View Controller delegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as?
                WalkthroughContentViewController {
                currentIndex = contentViewController.index
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
    
}
