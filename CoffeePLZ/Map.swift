//
//  Map.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/25/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

@IBDesignable class Map: UIView,CLLocationManagerDelegate {

    var customView: UIView!

    var manager = CLLocationManager()

    func putLocationOnMap(){

        //set the delegates
        self.manager.delegate = self
        //get the location info
        self.getLocationInfo()


        var camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true

        self.customView = mapView

        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView

    }

    //MARK: CLLocationDelegate methods

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
                println(pm)
            }
            
        })
    }

    //MARK: Helper methods

    func getLocationInfo(){
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }

    func getCoordinates(){

    }


    func xibSetup() {
        customView = loadViewFromNib()


        //HEY PUT SHIT HERE


        putLocationOnMap()




        // use bounds not frame or it'll be offset
        customView.frame = self.bounds

        // Make the view stretch with containing view
        customView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight

        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(customView)
    }

    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "Map", bundle: bundle)

        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView

        //        let view = nib.instantiateWithOwner(self, options: nil)[
        return view
    }



    override init(frame: CGRect) {
        // 1. setup any properties here

        println("OKAY THIS GOT CALLED")

        // 2. call super.init(frame:)

        super.init(frame: frame)

        // 3. Setup view from .xib file
        xibSetup()
    }

    required init(coder aDecoder: NSCoder) {
        // 1. setup any properties here

        println("OKAY THIS GOT CALLED too ")
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }

    
}
