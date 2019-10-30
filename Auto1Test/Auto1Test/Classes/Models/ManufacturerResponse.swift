//
//  ManufacturerResponse.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

struct ManufacturerResponse : Decodable {
    var page : Int?
    var pageSize : Int?
    var totalPageCount : Int?
    var wkda : [Manufacturer]?

}

extension ManufacturerResponse  {
    enum ManufacturerResponseKeys : String,CodingKey {
        case page
        case pageSize
        case totalPageCount
        case wkda
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: ManufacturerResponseKeys.self) // defining our (keyed) container
        let page: Int = try container.decode(Int.self, forKey: .page)
        let pageSize: Int = try container.decode(Int.self, forKey: .pageSize)
        let totalPageCount: Int = try container.decode(Int.self, forKey: .totalPageCount)
        let dict: [String:String] = try container.decode([String:String].self, forKey: .wkda)
        var wkda = [Manufacturer]()
        for (key,value) in dict {
            var manufacturer = Manufacturer()
            manufacturer.id = key
            manufacturer.name = value
            wkda.append(manufacturer)
        }
        
        if wkda.count > 0 { // to sort the array as dictionary to array conversion distorted the objects order
            wkda =  wkda.sorted { $0.name! < $1.name! }
        }
        

        self.init(page: page, pageSize: pageSize, totalPageCount: totalPageCount, wkda: wkda)
    }
}
