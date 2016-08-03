//
//  DetailViewController.swift
//  PageViewController
//
//  Created by S@nchit on 8/3/16.
//  Copyright © 2016 S@nchit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var index:NSInteger?
    override func viewDidLoad() {
        super.viewDidLoad()
        if index==0{
            self.view.backgroundColor=UIColor.blueColor()
        }else{
            self.view.backgroundColor = UIColor.grayColor()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
