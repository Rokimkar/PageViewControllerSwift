//
//  ViewController.swift
//  PageViewController
//
//  Created by S@nchit on 8/3/16.
//  Copyright © 2016 S@nchit. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    var pageViewController:UIPageViewController?
    var presentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        self.pageViewController!.dataSource=self
        let initialViewController:DetailViewController = self.giveRequiredViewController(1)
        let viewControllerArray:NSArray = [initialViewController]
        self.pageViewController?.setViewControllers(viewControllerArray as! [DetailViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview((self.pageViewController?.view)!)
        self.pageViewController?.didMoveToParentViewController(self)
        self.view.backgroundColor=UIColor.blackColor()
        self.navigationController?.navigationBar.barTintColor=UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
        let frame = CGRectMake(0, 64, self.view.frame.width, self.view.frame.height-40)
        self.pageViewController?.view.frame = frame
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        presentIndex = (viewController as! DetailViewController).index!
        if presentIndex==0{
            return nil
        }
       return self.giveRequiredViewController(presentIndex-1)
    }
    
    func giveRequiredViewController(index:NSInteger) -> DetailViewController {
        let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailViewController.index = index
        return detailViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        presentIndex = (viewController as! DetailViewController).index!
        if presentIndex==1{
            return nil
        }
        return self.giveRequiredViewController(presentIndex+1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

