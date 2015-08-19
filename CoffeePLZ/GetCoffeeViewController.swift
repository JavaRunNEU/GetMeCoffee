//
//  GetCoffeeViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/24/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps





class GetCoffeeViewController: UIViewController ,CLLocationManagerDelegate,UIScrollViewDelegate {

    let manager = CLLocationManager()



    @IBOutlet weak var registerIcon: UIBarButtonItem!



    
    @IBOutlet weak var mapView: Map!



    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.delegate = self
        setUpHamburger()
        getLocationInfo()
    }



    //MARK:Helper methods

    func getLocationInfo(){
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }

    func setUpHamburger(){
        self.registerIcon.target = self.revealViewController()
        self.registerIcon.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }



    func displayLocation(placemark: CLPlacemark) {
        self.manager.stopUpdatingLocation()
        println(placemark.location)
        println(placemark.locality)
        println(placemark.country)
        println(placemark.administrativeArea)
        println(placemark.description)
    }







}
