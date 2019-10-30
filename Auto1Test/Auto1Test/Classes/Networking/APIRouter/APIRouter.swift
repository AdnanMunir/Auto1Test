//
//  APIRouter.swift
//  
//
//  Created by Adnan Munir on 17/12/2018.
//  Copyright © 2018 A. All rights reserved.
//

import Foundation


struct APIRouter:URLRouter {
    
    static var basePath: String {
        return C.BaseURL.path
    }

    struct getManufacturers : Readable {
        var route: String = C.Endpoints.manufacturers
    }
    
    struct getModels : Readable {
        var route: String = C.Endpoints.models
    }
    
}
