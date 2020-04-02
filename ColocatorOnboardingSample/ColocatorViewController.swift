//
//  ViewController.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 01/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import UIKit
import SwiftSpinner

class ColocatorViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isIndoorEvent = UserDefaults.standard.value(forKey: isIndoorEventStorageKey) as? Bool ?? false
        
        if isIndoorEvent {
            backgroundImage.image = UIImage(named: "indoor-dark")
        } else {
            backgroundImage.image = UIImage(named: "outdoor-dark")
        }
        
        SwiftSpinner.show("Updating data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SwiftSpinner.hide()
        }
    }
    
    @IBAction func actionOpenSettingsViewController(_ sender: Any) {
        guard let openSettingsVC = storyboard?.instantiateViewController(withIdentifier: "OpenSettingsViewController") else {
            return
        }
        
        navigationController?.pushViewController(openSettingsVC, animated: true)
    }
}

