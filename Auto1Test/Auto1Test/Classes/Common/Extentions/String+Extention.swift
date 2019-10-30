//
//  String+Extention.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

extension String {
    
    var localize : String {
        get {
            return NSLocalizedString(self, comment: "")
        }
        set (key) { }
    }
}
