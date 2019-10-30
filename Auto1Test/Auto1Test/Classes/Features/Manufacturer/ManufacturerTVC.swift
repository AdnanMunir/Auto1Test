//
//  ManufacturerTVC.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import UIKit


class ManufacturerTVC: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    func configureView(_ manufacturer : Manufacturer? , index : Int) {
        
        lblID.text = manufacturer?.id
        lblTitle.text = manufacturer?.name
        
        if index % 2 == 0 {
            backgroundColor = UIColor.lightText
        } else {
            backgroundColor = UIColor.lightGray
        }
    }

}
