//
//  UIViewController+Extention.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func currentVC() -> UIViewController {
        let vc = UIApplication.shared.keyWindow!.rootViewController
        return findBestVC(vc: vc!)
    }
    
    func findBestVC(vc:UIViewController) -> UIViewController {
        if (vc.presentedViewController != nil) {
            return UIViewController().findBestVC(vc:vc.presentedViewController!)
        } else if (vc.isKind(of: UINavigationController.self)) {
            let rvc = vc as! UINavigationController
            if rvc.viewControllers.count > 0 {
                return UIViewController().findBestVC(vc:rvc.topViewController!)
            }
            return vc
        } else if (vc.isKind(of: UITabBarController.self)) {
            let rvc = vc as! UITabBarController
            if rvc.viewControllers!.count > 0 {
                return UIViewController().findBestVC(vc:rvc.selectedViewController!)
            }
            return vc
        } else {
            
            return vc
        }
        
    }
    
}
