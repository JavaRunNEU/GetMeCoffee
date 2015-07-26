//
//  Map.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/25/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import GoogleMaps

@IBDesignable class Map: UIView {

    var customView: UIView!


    func putLocationOnMap(){
        var camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true

        self.customView = mapView

//        var marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView

    }



    func xibSetup() {
        customView = loadViewFromNib()

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
