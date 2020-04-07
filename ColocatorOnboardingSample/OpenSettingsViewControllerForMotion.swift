//
//  OpenSettingsViewControllerForMotion.swift
//  ColocatorOnboardingSample
//
//  Created by TCode on 07/04/2020.
//  Copyright © 2020 CrowdConnected. All rights reserved.
//

import Foundation
import UIKit

protocol ManualMotionPermissionDelegate {
    func didEnableMotionPermission()
}

class OpenSettingsViewControllerForMotion: UIViewController {
    
     public var delegate: ManualMotionPermissionDelegate?
    
    @IBAction func actionOpenSettings(_ sender: Any) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        
        delegate?.didEnableMotionPermission()
        
        UserDefaults.standard.set(true, forKey: hasAskedForManualMotionPermissionKey)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let alert = UIAlertController(title: "Excelent", message: "You now have enabled the whole potential of your app", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (_) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
