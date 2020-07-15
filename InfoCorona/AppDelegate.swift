//
//  AppDelegate.swift
//  InfoCorona
//
//  Created by Shivam Rishi on 25/03/20.
//  Copyright © 2020 Shivam Rishi. All rights reserved.
//

import UIKit
import PopupDialog
import SwiftRater
import GoogleMobileAds


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        // Override point for customization after application launch.
        var navigationBarAppearace = UINavigationBar.appearance()
 
        navigationBarAppearace.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        navigationBarAppearace.barTintColor = .systemOrange
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        
        
                let pv = PopupDialogDefaultView.appearance()
                pv.titleFont    = UIFont(name: "HelveticaNeue-Light", size: 18)!
                pv.titleColor   = .white
                pv.messageFont  = UIFont(name: "HelveticaNeue", size: 16)!
                pv.messageColor = .lightText
       
        
        let containerAppearance = PopupDialogContainerView.appearance()

        containerAppearance.backgroundColor = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)

        containerAppearance.cornerRadius    = 2
        containerAppearance.shadowEnabled   = true
        containerAppearance.shadowColor     = .black
        containerAppearance.shadowOpacity   = 0.6
        containerAppearance.shadowRadius    = 20
        containerAppearance.shadowOffset    = CGSize(width: 0, height: 8)
      
        
         let db = DefaultButton.appearance()
                db.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
                db.titleColor     = .white
                db.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
                db.separatorColor = .white
        

        SwiftRater.daysUntilPrompt = 7
        SwiftRater.usesUntilPrompt = 5
        SwiftRater.daysBeforeReminding = 5
        SwiftRater.showLaterButton = true
        SwiftRater.showLog = true
        SwiftRater.appLaunched()
       
        return true
    }

   
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

