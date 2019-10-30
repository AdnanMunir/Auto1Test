//
//  ModelCoordinator.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation
import UIKit

class ModelCoordinator:Coordinator {
    weak var parentCoordinator : ManufacturerCoordinator?
    var modelVM : ModelVM?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ModelVC.instantiate(withStoryBoard: .Model)
        vc.modelVM = modelVM
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveBackToManufacturers() {
        parentCoordinator?.childDidFinish(self)
    }
    
}
