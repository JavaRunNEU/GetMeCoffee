//
//  ViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/21/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import Foundation
import Parse

class RootViewController: UIViewController{



    override func viewDidLoad() {
        super.viewDidLoad()
        //        let testObject = PFObject(className: "TestObject")
        //        testObject["foo"] = "bar"
        //        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        //            println("Object has been saved.")
        //        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoGetGetCoffee" {
//            let GVC = GetCoffeeViewController()
            println("GOOO RN")
//            segue.destinationViewController.delegate = self
        }
    }

    @IBAction func onDrinkNowTapped(sender: UIButton) {

    }


}

