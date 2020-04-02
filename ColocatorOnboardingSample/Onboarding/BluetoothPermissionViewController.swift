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
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            backgroundImage.image = UIImage(named: "indoor-dark")
        } else {
            backgroundImage.image = UIImage(named: "outdoor-dark")
        }
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
