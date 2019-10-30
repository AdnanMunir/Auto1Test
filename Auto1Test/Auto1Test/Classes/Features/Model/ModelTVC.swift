//
//  ModelTVC.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import UIKit

class ModelTVC: UITableViewCell {
    @IBOutlet weak var lblModel: UILabel!
    
    func configureView(_ model : Model? , index : Int) {
        
        lblModel.text = model?.name
        
        if index % 2 == 0 {
            backgroundColor = UIColor.lightText
        } else {
            backgroundColor = UIColor.lightGray
        }
    }

}
