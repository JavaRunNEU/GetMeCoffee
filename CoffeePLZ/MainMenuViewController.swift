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


    var json: JSON = JSON.nullJSON

    override func viewWillAppear(animated: Bool) {
//        addNavBarButton()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var shiz = json[0]
        println(shiz["Title"])


    }

    //MARK: - Helper methods

//    func addNavBarButton()
//    {
//        //    var backBtn = UIButton(buttonWithType:UIButtonTypeCustom)
//        var backBtn = UIButton()
//        let backBtnImage = UIImage(named: "marker20")
//        backBtn.setBackgroundImage(backBtnImage, forState: UIControlState.Normal)
//
//
//        var select = Selector(goToCheckout())
//        backBtn.addTarget(nil, action: select, forControlEvents: UIControlEvents.TouchUpInside)
//        backBtn.frame = CGRectMake(0, 0, 32, 32)
//        var backBtnView = UIView(frame: CGRectMake(0, 0, 32, 32))
//        backBtnView.bounds = CGRectOffset(backBtnView.bounds, 16, 0)
//        backBtnView.addSubview(backBtn)
//        var backButton = UIBarButtonItem(customView: backBtnView)
//        self.navigationItem.rightBarButtonItem = backButton
//    }




    //MARK: - Navigation 

    func goToCheckout() {
        println("WTF")
//        self.performSegueWithIdentifier("drinkBeers", sender: self)
        let CheckoutVC = CheckoutViewController()

        self.navigationController?.pushViewController(CheckoutVC, animated: false)
//        MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
//        [self.navigationController pushViewController:mainMenuViewController animated:NO];

    }



    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.json.type {
        case Type.Array, Type.Dictionary:
            return self.json.count
        default:
            return 1
        }
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell


        var row = indexPath.row
        switch self.json.type {
        case .Array:
            cell.textLabel?.text = "\(row)"
            cell.detailTextLabel?.text = self.json.arrayValue.description
        case .Dictionary:
            let key: AnyObject = self.json.dictionaryValue.keys.array[row]
            let value = self.json[key as! String]
            cell.textLabel?.text = "\(key)"
            cell.detailTextLabel?.text = value.description
        default:
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = self.json.description
        }


        return cell
    }


    //MARK: - Table view delegate


    @IBOutlet weak var tableView: UITableView!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "hello" {
            var object: AnyObject
            switch UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch) {
            case .OrderedSame, .OrderedDescending:
                object = segue.destinationViewController.topViewController
            case .OrderedAscending:
                object = segue.destinationViewController
            }

            if let nextController = object as? MainMenuViewController {

                if let indexPath = self.tableView.indexPathForSelectedRow() {
                    var row = indexPath.row
                    var nextJson: JSON = JSON.nullJSON

                    switch self.json.type {
                    case .Array:
                        nextJson = self.json[row]
                    case .Dictionary where row < self.json.dictionaryValue.count:
                        let key = self.json.dictionaryValue.keys.array[row]
                        if let value = self.json.dictionary?[key] {
                            nextJson = value
                        }
                    default:
                        println("LOL")
                        print("")
                    }
                    nextController.json = nextJson
                    print(nextJson)
                }
            }
        }



}

    
}







