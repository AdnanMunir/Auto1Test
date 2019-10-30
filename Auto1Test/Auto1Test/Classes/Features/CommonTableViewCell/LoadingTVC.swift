//
//  LoadingTVC.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import UIKit

class LoadingTVC: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    func startLoading() {
        activityIndicator.startAnimating()
    }
    
}
