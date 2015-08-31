//
//  AppDelegate.swift
//  CoffeePLZ
//
//  Created by alex fallah on 7/21/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import Parse
import GoogleMaps
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var root: UINavigationController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {


        Parse.setApplicationId("UNw9uU7NNidkQ9R4PW5rElbbSB2eTl2qFRIPLtya",
            clientKey: "4XfhydBgT3l4iYnZZr8XdJXd4Uo0aBdGWDA4GOJr")

        GMSServices.provideAPIKey("AIzaSyBq1U0PrR40QN-ff92DU5AiBqzuyqmKpd0")
        // Override point for customization after application launch.

        let navigationController = self.window?.rootViewController as! UINavigationController
        let viewController = navigationController.topViewController as! MainMenuViewController

        if let file = NSBundle(forClass:AppDelegate.self).pathForResource("JAVA", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            let json = JSON(data:data)
            viewController.json = json
        } else {
            viewController.json = JSON.nullJSON
        }


        



        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

