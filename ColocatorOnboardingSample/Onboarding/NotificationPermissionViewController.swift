//
//  NotificationPermissionViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit

class NotificationPermissionViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var stepsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            backgroundImage.image = UIImage(named: "indoor-dark")
        } else {
            backgroundImage.image = UIImage(named: "outdoor-dark")
            stepsStackView.subviews.last?.removeFromSuperview()
        }
    }
    
    @IBAction func actionAllowNotification(_ sender: Any) {
        UIApplication.shared.registerForRemoteNotifications()
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.alert,.badge]) { granted, error in
            DispatchQueue.main.async {
                self.goToNextScreen()
            }
        }
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        goToNextScreen()
    }
    
    private func goToNextScreen() {
        guard let locationPermissionVC = storyboard?.instantiateViewController(withIdentifier: "LocationPermissionViewController") else {
            return
        }
        navigationController?.pushViewController(locationPermissionVC, animated: true)
    }
}
