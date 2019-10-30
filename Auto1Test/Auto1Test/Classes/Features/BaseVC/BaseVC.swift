//
//  BaseVC.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setNavigationBarTitle(_ title : String)  {
        navigationItem.title = title.localize
    }

}
