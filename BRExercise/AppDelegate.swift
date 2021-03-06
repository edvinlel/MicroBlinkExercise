//
//  AppDelegate.swift
//  BRExercise
//
//  Created by Edvin Lellhame on 1/14/21.
//

import UIKit
import BlinkReceipt

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let license = "sRwAAAEcY29tLmVkdmlubGVsbGhhbWUuYnJleGVyY2lzZVv5SDIzH2AIsmy2j5bVjHyiLX41bM/OYIPmlKKlmOGmKRUSM1VF2hehtmhTesYAXjsx7o1LWoNxVAhV247AjThUgo4HkVk7fjt6VdRkziP/hmojPOm4oPT0UMsXmucKyINRzxl2Vbbvx1mitzA8SVJ8gonPLPjgQco+VV59ebSjGF4BSUcN"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        BRScanManager.shared().licenseKey = license
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

