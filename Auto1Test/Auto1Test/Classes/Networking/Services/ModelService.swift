//
//  ModelService.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

struct ModelService {
    func getModels (_ request: ModelRequest, completion: @escaping(_ response : Result<ModelResponse>) -> Void) {
        
        let dict = ["page" : request.pageNo ?? 0,
                    "pageSize" : request.pageSize ?? C.pageSize,
                    "manufacturer" : request.manufacturer ?? 0] as [String : Any]
        
        let router = APIRouter.getModels.get(parameters: dict)
        OLAPIInterface.sharedInstance.request(router, decodingType: ModelResponse.self, completion: completion)
    }
}
