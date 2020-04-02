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
    
    override func viewDidLoad() {
          super.viewDidLoad()
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
