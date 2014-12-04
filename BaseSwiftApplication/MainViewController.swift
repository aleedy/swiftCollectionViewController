//
//  ViewController.swift
//  BaseSwiftApplication
//
//  Created by Ryan Ploetz on 12/4/14.
//  Copyright (c) 2014 Ryan Ploetz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        label = UILabel(frame: CGRect(x: 50, y: 50, width: 400, height: 100))
        label.text = "Base Swift Application"
        label.font = UIFont.boldSystemFontOfSize(14)
        self.view.addSubview(label)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

