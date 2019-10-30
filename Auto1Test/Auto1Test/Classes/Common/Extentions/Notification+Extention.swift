//
//  Notification+Extention.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let sessionOut = Notification.Name("sessionOut")
    static let internalServerError = Notification.Name("internalServerError")
    static let pageNotfound = Notification.Name("pageNotfound")
    static let apiError = Notification.Name("apiError")
    static let serverNotfound = Notification.Name("serverNotfound")
    static let showProfile = Notification.Name("showProfile")
    static let showNewsfeed = Notification.Name("showNewsfeed")
}
