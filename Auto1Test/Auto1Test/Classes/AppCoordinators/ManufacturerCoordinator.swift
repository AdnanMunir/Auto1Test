//
//  ManufacturerCoordinator.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation
import UIKit

class ManufacturerCoordinator:Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ManufacturerVC.instantiate(withStoryBoard: .Manufacturer)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveToModel(_ vm : ModelVM) {
        let coordinator = ModelCoordinator(navigationController: navigationController)
        coordinator.modelVM = vm
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    
}
