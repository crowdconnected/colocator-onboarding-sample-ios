//
//  PrivacyPermissionViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit

class PrivacyPermissionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionAccestPolicy(_ sender: Any) {
        goToNextScreen()
    }
    
    @IBAction func actionReactPolicy(_ sender: Any) {
        if let url = URL(string: "https://crowdconnected.com") {
            UIApplication.shared.open(url)
        }
    }
    
    private func goToNextScreen() {
        guard let notificationPermissionVC = storyboard?.instantiateViewController(withIdentifier: "NotificationPermissionViewController") else {
            return
        }
        navigationController?.pushViewController(notificationPermissionVC, animated: true)
    }
}
