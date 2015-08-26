//
//  ResturauntViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 8/16/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import SwiftyJSON
import Spring

class ResturauntViewController: UITableViewController,UITableViewDataSource,UITableViewDelegate, AFRViewCellDelegate {




    var shiz: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        parseMenu()
        self.tableView.registerNib(UINib(nibName: "AFRViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }


    var json: JSON = JSON.nullJSON


    //MARK: Parsing menu
    func parseMenu() {
        if let file = NSBundle(forClass:AppDelegate.self).pathForResource("JavaMenu", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            self.json = JSON(data:data)
            println(self.json[0]["Title"][0].string)
        } else {
            //do something with error checking
        }

    }

    // MARK: - Table view data source


    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.section)
    }


   

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.json.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        //do funky stuff with font
//        let header = self.json["results"]["collection1"][section]["property2"][1]["text"].string
//        return header
//    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title: SpringLabel = SpringLabel()
        title.text = self.json[section]["Title"].string
//        title.backgroundColor = UIColor.blueColor()
//        if self.shiz == true{
//            title.animation = "pop"
//            title.curve = "easeInOut"
//            title.duration = 1.0
//            title.text = "YOOO"
//            title.animateTo()
//
//
//        }

        return title
    }




    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell:AFRViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AFRViewCell

        cell.delegate = self

        return cell
    }



    func cellButtonTapped(cell: AFRViewCell) {
        let indexPath = tableView.indexPathForRowAtPoint(cell.center)!
        println("INDEX PATH.ROW " + indexPath.row.description)
        goUp()
        println("INDEX PATH.Section  " + indexPath.section.description)
    }

    func goUp() {
        self.shiz = !self.shiz

        self.tableView.reloadData()
    }
    

    

    
}
