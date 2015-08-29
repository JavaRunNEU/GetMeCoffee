//
//  TableViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 8/26/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import SwiftyJSON


class MainMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  

    override func viewDidLoad()
    {
        super.viewDidLoad()
        parseMenu()
    }




    var json: JSON = JSON.nullJSON
//    var rests: Dictionary = Dictionary()

    //MARK: Parsing menu
    func parseMenu()
    {
        if let file = NSBundle(forClass:AppDelegate.self).pathForResource("JavaMenu", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            self.json = JSON(data:data)
            println(self.json[0])
        } else {
            //do something with error checking
        }
        
    }


    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "Hi zach"

        return cell
    }



}
