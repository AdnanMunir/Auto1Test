//
//  ManufacturerService.swift
//  Auto1Test
//
//  Created by Adnan Munir on 15/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

struct ManufacturerService {
    func getManufacturers (_ request: ManufacturerRequest, completion: @escaping(_ response : Result<ManufacturerResponse>) -> Void) {
        
        let dict = ["page" : request.pageNo ?? 0,
                    "pageSize" : request.pageSize ?? C.pageSize]
        
        let router = APIRouter.getManufacturers.get(parameters: dict)
        OLAPIInterface.sharedInstance.request(router, decodingType: ManufacturerResponse.self, completion: completion)
    }
}
