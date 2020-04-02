//
//  MotionPermissionViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit
import CCLocation

class MotionPermissionViewController: UIViewController {
    
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
      
    @IBAction func actionAllowMotion(_ sender: Any) {
        CCLocation.sharedInstance.triggerMotionPermissionPopUp()
        
        //TODO find a way to go to the next vc when user had chosen an option
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.goToNextScreen()
        }
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        goToNextScreen()
    }
    
    private func goToNextScreen() {
          guard let bluetoothPermissionVC = storyboard?.instantiateViewController(withIdentifier: "BluetoothPermissionViewController") else {
              return
          }
          navigationController?.pushViewController(bluetoothPermissionVC, animated: true)
      }
}
