//
//  AFRViewCell.swift
//  CoffeePLZ
//
//  Created by alex fallah on 8/16/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import SwiftyJSON

class AFRViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

  
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        parseMenu()


        self.collectionView.backgroundView?.backgroundColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)


        var flowLayout =  UICollectionViewFlowLayout()

        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.itemSize = CGSizeMake(130.0, 170.0)
        self.collectionView.setCollectionViewLayout(flowLayout, animated: true)


        self.collectionView.registerNib(UINib(nibName: "AFMenuCell", bundle: nil), forCellWithReuseIdentifier: "AFMenuCell")


    }

    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>, indexPath: NSIndexPath) {
        self.collectionView.dataSource = delegate
        self.collectionView.delegate = delegate
        self.collectionView.tag = indexPath.section
        self.collectionView.reloadData()
    }


    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        var cell: AFMenuCell = collectionView.dequeueReusableCellWithReuseIdentifier("AFMenuCell", forIndexPath: indexPath) as! AFMenuCell

        cell.title.text = self.json["results"]["collection1"][indexPath.row]["property2"][1]["text"].string


        return cell

    }



    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.json["results"]["collection1"].count
    }


    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)


        println(indexPath.description)
        println(collectionView.collectionViewLayout.description)
        }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }



    var json: JSON = JSON.nullJSON


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


    //MARK: DHCOllection stuff


    class DHIndexedCollectionView: UICollectionView {

        var indexPath: NSIndexPath!

        override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            super.init(frame: frame, collectionViewLayout: layout)
        }

        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    }


    
}
