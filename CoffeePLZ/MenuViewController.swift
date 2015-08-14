    //
//  MenuViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 8/11/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire



class MenuViewController: UICollectionViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var json: JSON = JSON.nullJSON


    internal let animationDuration: Double! = 1.0
    
    let kSecondVCId = "secondVC"
    let kCellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

    
        parseMenu()





    }


    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation,
        fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

            let animator = CKWaveCollectionViewAnimator()

            if operation != UINavigationControllerOperation.Push {

                animator.reversed = true
            }
            
            return animator
    }
    
    //MARK :- UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        self.selectedIndexPath = indexPath

        var vc = self.storyboard?.instantiateViewControllerWithIdentifier(kSecondVCId) as? SecondCollectionViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }


    //MARK :- UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

//        var cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(kCellId, forIndexPath: indexPath) as! MenuItemCell

        var cell :UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(kCellId, forIndexPath: indexPath) as! UICollectionViewCell

//        cell.title.text = "K"
        self.collectionView?.registerClass(MenuItemCell.self, forCellWithReuseIdentifier: kCellId)

        

//        cell.image.image =  UIImage(named: "")

        return cell
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    //MARK: Parsing menu
    func parseMenu() {
        if let file = NSBundle(forClass:AppDelegate.self).pathForResource("kimonoData", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            self.json = JSON(data:data)
            println(self.json["results"]["collection1"][0]["property2"][1]["href"])
        } else {
            //do something with error checking
        }

    }




}
