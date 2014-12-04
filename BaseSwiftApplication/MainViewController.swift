//
//  ViewController.swift
//  BaseSwiftApplication
//
//  Created by Ryan Ploetz on 12/4/14.
//  Copyright (c) 2014 Ryan Ploetz. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {

    let bottomNavHeight = 50
    
    var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        if let bottomCollectionView = collectionView {
            bottomCollectionView.frame = CGRect(x: 0, y: self.view.bounds.height-bottomNavHeight, height: bottomNavHeight)
            bottomCollectionView.backgroundColor = UIColor.redColor()
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

