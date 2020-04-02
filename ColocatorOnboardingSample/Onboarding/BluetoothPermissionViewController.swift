//
//  BluetoothPermissionViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit
import CCLocation

class BluetoothPermissionViewController: UIViewController {
    
    override func viewDidLoad() {
          super.viewDidLoad()
      }
      
    @IBAction func actionAllowBluetooth(_ sender: Any) {
        CCLocation.sharedInstance.triggerBluetoothPermissionPopUp()
        //find a way to push next VC when user has chosen
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.finnishOnboarding()
        }
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        finnishOnboarding()
    }
    
    private func finnishOnboarding() {
        UserDefaults.standard.set(true, forKey: isUserOnboardedStorageKey)
        AppFlowController.switchRootViewController()
    }
}
