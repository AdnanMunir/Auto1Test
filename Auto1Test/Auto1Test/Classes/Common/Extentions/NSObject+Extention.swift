//
//  NSObject+Extention.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

extension NSObject {
    class var string : String {
        get {
            return String(describing: self) // gives name of the class
        } set (key) { }
    }
}
