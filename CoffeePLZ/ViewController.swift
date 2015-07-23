//
//  ViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/21/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import Parse

class ViewController: UIViewController, CLLocationManagerDelegate {



    let manager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.delegate = self
        doManagerShiz()

        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
    }

    func doManagerShiz(){
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
        println(manager)

    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                println(error)
                return //break of this method and return
            }

            if placemarks.count > 0{
                let pm = placemarks[0] as! CLPlacemark

                self.displayLocation(pm)
            }

        })
    }


    func displayLocation(placemark: CLPlacemark) {
        self.manager.stopUpdatingLocation()
        println(placemark.location)
        println(placemark.locality)
        println(placemark.country)
        println(placemark.administrativeArea)
        println(placemark.description)
    }


    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
}

