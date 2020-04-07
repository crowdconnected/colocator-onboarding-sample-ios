//
//  ViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import UIKit
import SwiftSpinner
import CoreLocation

class ColocatorViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var permissionDeniedLabel: UILabel!
    @IBOutlet weak var manualPermissionLocationButton: UIButton!
    @IBOutlet weak var manualPermissionMotionButton: UIButton!
    
     var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            backgroundImage.image = UIImage(named: "indoor-dark")
        } else {
            backgroundImage.image = UIImage(named: "outdoor-dark")
        }
        
        let hasAskedForManualLocationPermission = UserDefaults.standard.value(forKey: hasAskedForManualLocationPermissionKey) as? Bool ?? false
        manualPermissionLocationButton.isHidden = hasAskedForManualLocationPermission
        
        let hasAskedForManualMotionPermission = UserDefaults.standard.value(forKey: hasAskedForManualMotionPermissionKey) as? Bool ?? false
        manualPermissionMotionButton.isHidden = hasAskedForManualMotionPermission
        
        if hasAskedForManualLocationPermission && hasAskedForManualMotionPermission {
            permissionDeniedLabel.isHidden = true
        }
        
        SwiftSpinner.show("Updating data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SwiftSpinner.hide()
        }
    }
    
    @IBAction func actionOpenSettingsViewController(_ sender: Any) {
        guard let openSettingsVC = storyboard?.instantiateViewController(withIdentifier: "OpenSettingsViewControllerForLocation")
            as? OpenSettingsViewControllerForLocation else {
            return
        }
        openSettingsVC.delegate = self
      
        navigationController?.pushViewController(openSettingsVC, animated: true)
    }
    
    @IBAction func actionOpenMotionSettingsViewController(_ sender: Any) {
        guard let openMotionSettingsVC = storyboard?.instantiateViewController(withIdentifier: "OpenSettingsViewControllerForMotion")
            as? OpenSettingsViewControllerForMotion else {
            return
        }
        openMotionSettingsVC.delegate = self
        navigationController?.pushViewController(openMotionSettingsVC, animated: true)
    }
}

extension ColocatorViewController: ManualLocationPermissionDelegate, ManualMotionPermissionDelegate {
    func didEnableMotionPermission() {
        manualPermissionMotionButton.isHidden = true
    }
    
    func didEnableLocationPermission() {
        manualPermissionLocationButton.isHidden = true
    }
}
