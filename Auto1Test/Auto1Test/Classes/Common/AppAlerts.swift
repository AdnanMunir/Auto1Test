//
//  AppAlerts.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation
import UIKit

class AppAlerts  {
    class func showAlert(message:String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localize, style: .default, handler: nil))
        let topVC = UIViewController().currentVC()
        topVC.present(alert, animated: true, completion: nil)
        
    }
}
