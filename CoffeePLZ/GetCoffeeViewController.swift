//
//  GetCoffeeViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/24/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import CoreLocation

class GetCoffeeViewController: UIViewController,CLLocationManagerDelegate, UITabBarDelegate {

    let manager = CLLocationManager()


    @IBOutlet weak var tabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.delegate = self
        doManagerShiz()

    }


    //MARK:Helper methods

    func doManagerShiz(){
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
        println(manager)

    }

    func displayLocation(placemark: CLPlacemark) {
        self.manager.stopUpdatingLocation()
        println(placemark.location)
        println(placemark.locality)
        println(placemark.country)
        println(placemark.administrativeArea)
        println(placemark.description)
    }

    //MARK:TabBar Delegate

    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        println(item.title)
        println(tabBar.description)`

        //if item.title!  == "Coffee now"
        //perform a creepy controller modal popup like uber 
    }



    //MARK:CLLocation Delegate

    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
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




}
