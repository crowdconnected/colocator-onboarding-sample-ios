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
    @IBOutlet weak var manualParmissionButton: UIButton!
    
     var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            backgroundImage.image = UIImage(named: "indoor-dark")
        } else {
            backgroundImage.image = UIImage(named: "outdoor-dark")
        }
        
        let hasAskedForManualPermission = UserDefaults.standard.value(forKey: hasAskedForManualPermissionKey) as? Bool ?? false
        manualParmissionButton.isHidden = hasAskedForManualPermission
        
        SwiftSpinner.show("Updating data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SwiftSpinner.hide()
        }
    }
    
    @IBAction func actionOpenSettingsViewController(_ sender: Any) {
        guard let openSettingsVC = storyboard?.instantiateViewController(withIdentifier: "OpenSettingsViewController")
            as? OpenSettingsViewController else {
            return
        }
        openSettingsVC.delegate = self
      
        navigationController?.pushViewController(openSettingsVC, animated: true)
    }
}

extension ColocatorViewController: ManualPermissionDelegate {
    func didEnablePermission() {
        manualParmissionButton.isHidden = true
    }
}
