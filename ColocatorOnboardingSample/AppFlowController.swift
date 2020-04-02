//
//  AppFlowController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit

class AppFlowController {
    
    static func switchRootViewController() {
        var rootVC: UIViewController?
        
        let userOnboarded = UserDefaults.standard.value(forKey: isUserOnboardedStorageKey) as? Bool ?? false
        
        if userOnboarded {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ColocatorNavigationController")
        } else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnboardingNavigationController")
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
    }
}
