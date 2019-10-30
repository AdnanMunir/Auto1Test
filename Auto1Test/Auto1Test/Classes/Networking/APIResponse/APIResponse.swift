//
//  Response.swift
//  Pace
//
//  Created by Adnan Munir on 19/12/2018.
//  Copyright © 2018 A. All rights reserved.
//

import Foundation

struct APIResponse:Decodable {
    let error: String?
    let success : SucessResponse?
    
    private enum CodingKeys:String,CodingKey {
        case error
        case success = "SUCCESS"
    }
    
}

struct SucessResponse:Decodable {
    var error:String?
    
    private enum CodingKeys:String,CodingKey {
        case error
    }
}
