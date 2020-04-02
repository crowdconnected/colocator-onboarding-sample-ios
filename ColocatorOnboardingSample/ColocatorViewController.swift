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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

