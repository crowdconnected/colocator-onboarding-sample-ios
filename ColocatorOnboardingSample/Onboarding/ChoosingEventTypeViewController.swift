//
//  ChoosingEventTypeViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit

class ChoosingEventTypeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionIndoorEvent(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: isIndoorEventStorageKey)
        goToNextScreen()
    }
    
    @IBAction func actionOutdoorEvent(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: isIndoorEventStorageKey)
        goToNextScreen()
    }
    
    private func goToNextScreen() {
        guard let privacyVC = storyboard?.instantiateViewController(withIdentifier: "PrivacyPermissionViewController") else {
            return
        }
        navigationController?.pushViewController(privacyVC, animated: true)
    }
}
