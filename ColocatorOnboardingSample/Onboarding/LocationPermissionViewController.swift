//
//  LocationViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationPermissionViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var stepsStackView: UIStackView!
    
    var locationManager: CLLocationManager?
    var isFirstCallback = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            backgroundImage.image = UIImage(named: "indoor-dark")
        } else {
            backgroundImage.image = UIImage(named: "outdoor-dark")
            stepsStackView.subviews.last?.removeFromSuperview()
            stepsStackView.subviews.last?.removeFromSuperview()
        }
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    @IBAction func actionAllowLocation(_ sender: Any) {
        locationManager?.requestAlwaysAuthorization()
    }
    
    @IBAction func actionSkip(_ sender: Any) {
         let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            goToNextScreen()
        } else {
            UserDefaults.standard.set(true, forKey: isUserOnboardedStorageKey)
             AppFlowController.switchRootViewController()
        }
    }
    
    private func goToNextScreen() {
        guard let motionPermissionVC = storyboard?.instantiateViewController(withIdentifier: "MotionPermissionViewController") else {
            return
        }
        navigationController?.pushViewController(motionPermissionVC, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if isFirstCallback {
            isFirstCallback = false
            return
        }
        
        switch status {
        case .notDetermined:
            print("Not Determined")
            break
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways:
            print("Always")
        case .authorizedWhenInUse:
            print("While in Use")
        @unknown default: break
        }
        
        let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            goToNextScreen()
        } else {
            UserDefaults.standard.set(true, forKey: isUserOnboardedStorageKey)
             AppFlowController.switchRootViewController()
        }
    }
}
