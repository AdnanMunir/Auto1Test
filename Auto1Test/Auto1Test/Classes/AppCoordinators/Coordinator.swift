//
//  Coordinator.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] {get set}
    var navigationController : UINavigationController {get set}
    
    func start()
}

extension Coordinator {
    func childDidFinish(_ child : Coordinator) {
        for (index,coordinator) in  childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
