//
//  ViewController.swift
//  BaseSwiftApplication
//
//  Created by Ryan Ploetz on 12/4/14.
//  Copyright (c) 2014 Ryan Ploetz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIGestureRecognizerDelegate {

    let bottomNavHeight = 50
    
    var label: UILabel!
    var collectionView: UICollectionView?
    var heroView: UIView?
    var newHeroView: UIView?
    var isDragging = false
    var selectedCell: UICollectionViewCell?
    var dragPosition: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 50, height: 100)
        layout.scrollDirection = .Horizontal
        var collectionViewFrame = CGRect(x: 0, y: self.view.frame.height-120, width: self.view.frame.width, height: 120)
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.blackColor()
    
        heroView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-120))
        heroView!.backgroundColor=UIColor.whiteColor()
        self.view.addSubview(heroView!)
        self.view.addSubview(collectionView!)
        
        var longPressRecognizor = UIPanGestureRecognizer(target: self, action: "handleDrag:")
        
        longPressRecognizor.delegate = self
        collectionView!.addGestureRecognizer(longPressRecognizor)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func handleDrag(caller : UIGestureRecognizer){
        if caller.state == UIGestureRecognizerState.Ended {
            self.isDragging = false
            self.dragPosition = nil;
            if let swipeGesture = caller as? UIPanGestureRecognizer{
                let velocity = swipeGesture.velocityInView(self.view)
                if velocity.y < 0 {
                    UIView.transitionWithView(self.newHeroView!, duration: 0.3, options: nil, animations: {
                       
                        self.newHeroView!.frame.origin.y = 0
                        
     
                        
                        }, completion: { finished in
                            // any code entered here will be applied
                            // .once the animation has completed
                    })
                } else {
                    UIView.transitionWithView(self.newHeroView!, duration: 0.3, options: nil, animations: {
                        
                        self.newHeroView!.frame.origin.y = self.collectionView!.frame.origin.y
                        
                        
                        
                        }, completion: { finished in
                            // any code entered here will be applied
                            // .once the animation has completed
                    })

                }
            }
            self.heroView = self.newHeroView

            
            
        } else {
            var gesture = caller as UIPanGestureRecognizer
            self.dragPosition = caller.locationInView(self.view)
            if !isDragging {
                var p = caller.locationInView(collectionView!)
                var indexPath = self.collectionView!.indexPathForItemAtPoint(p)
                if( indexPath != nil){
                    self.addExpandedViewforCellAtIndexPath(indexPath!)
                }
                isDragging = true
            } else {
                newHeroView!.frame.origin.y = self.dragPosition!.y-20
                

            }
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addExpandedViewforCellAtIndexPath(indexPath : NSIndexPath){
        newHeroView = UIView(frame: CGRect(x: collectionView!.frame.origin.x, y: collectionView!.frame.origin.y, width: heroView!.frame.size.width, height: heroView!.frame.size.height))
        newHeroView!.backgroundColor = collectionView!.cellForItemAtIndexPath(indexPath)?.backgroundColor;
        self.view.addSubview(newHeroView!)
        self.view.bringSubviewToFront(self.collectionView!)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        cell.backgroundColor = getBackgroundColorForCell()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.addExpandedViewforCellAtIndexPath(indexPath)
        UIView.transitionWithView(self.newHeroView!, duration: 0.3, options: nil, animations: {
            
            self.newHeroView!.frame.origin.y = 0
            
            
            
            }, completion: { finished in
                    self.heroView = self.newHeroView
        })

        
    
    }
    
    
    func getBackgroundColorForCell() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    


}

