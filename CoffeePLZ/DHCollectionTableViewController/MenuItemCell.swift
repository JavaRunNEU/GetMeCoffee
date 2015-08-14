//
//  MenuItemCell.swift
//  CoffeePLZ
//
//  Created by alex fallah on 8/14/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit

@IBDesignable class MenuItemCell: UICollectionViewCell{

    var customView: UIView!

    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var title: UILabel!


    func xibSetup() {
        customView = loadViewFromNib()


        //HEY PUT SHIT HERE


        // use bounds not frame or it'll be offset
        customView.frame = self.bounds

        // Make the view stretch with containing view
        customView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight

        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(customView)
    }





    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MenuItemCell", bundle: bundle)

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

      
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)

        // 3. Setup view from .xib file
//        xibSetup()
    }


}
