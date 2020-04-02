//
//  AppDelegate.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import UIKit
import CCLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        CCLocation.sharedInstance.start(apiKey: colocatorAppKey)
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        CCLocation.sharedInstance.addAlias(key: "apns_user_id", value: tokenString)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let source = userInfo["source"] as? String ?? ""
        if source == "colocator" {
            CCLocation.sharedInstance.receivedSilentNotification(userInfo: userInfo, clientKey: colocatorAppKey) { isNewData in
                if isNewData {
                    completionHandler(.newData)
                } else {
                    completionHandler(.noData)
                }
            }
        }
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        CCLocation.sharedInstance.updateLibraryBasedOnClientStatus(clientKey: colocatorAppKey) { success in
            if success {
                completionHandler(.newData)
            } else {
                completionHandler(.noData)
            }
        }
    }

}

