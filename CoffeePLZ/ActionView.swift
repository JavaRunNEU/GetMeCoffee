//
//  ActionView.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/24/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
//protocol ActionViewDelegate {
//    func ActionView(didTapButton: String)
//}

@IBDesignable class ActionView: UIView {

//    var delegate: ActionViewDelegate

    // Our custom view from the XIB file
    var customView: UIView!



    @IBAction func onPressMeTapped(sender: UIButton) {
        println("tapped")
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
        let nib = UINib(nibName: "ActionView", bundle: bundle)

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
