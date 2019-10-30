//
//  ManufacturerVM.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

protocol ManufacturerModeling {
    
    typealias updateViewAlias = () -> ()
    var updateView : updateViewAlias? {get set}
    
    func getManufacturers()
    func getManufacturer(at index : Int) -> Manufacturer?
    func getRows() -> Int
    func getNextData()
    func isShowLoadingCell(_ index : Int) -> Bool
    
}

class ManufacturerVM: ManufacturerModeling {
    
    var updateView: ManufacturerModeling.updateViewAlias?
    private let manufacturerService = ManufacturerService()
    private var manufacturerResponse : ManufacturerResponse?
    private var currentPage = 1
    private var manufacturers : [Manufacturer]?
    
    func getManufacturers() {
        
        if currentPage > manufacturerResponse?.totalPageCount ?? 1 {return} //to stop extra Network calls while scrolling
        
        var request = ManufacturerRequest()
        request.pageNo = currentPage - 1 // as pages start from 0
        request.pageSize = C.pageSize
        
        manufacturerService.getManufacturers(request) {[weak self] (result) in
            switch result {
            case .success(let response):
               // print(response ?? [])
                self?.configureResponse(response: response)
            
                break
            case .failure(let reason):
                AppAlerts.showAlert(message: reason.localizedDescription)
                print(reason)
                break
            }
        }
    }
    
    private func configureResponse(response : ManufacturerResponse?) {
        if currentPage == 1 { // If first page then initialize the array
            manufacturers = [Manufacturer]()
        }
        manufacturerResponse = response
        manufacturers?.append(contentsOf: response?.wkda ?? [])
        updateView?()
    }
    
    func getManufacturer(at index: Int) -> Manufacturer? {
        return manufacturers?[index]
    }
    
    func getRows() -> Int {
    
        if currentPage < manufacturerResponse?.totalPageCount ?? 0 {
            return (manufacturers?.count ?? 0) + 1 // To show last loading cell
        }
        
        return manufacturers?.count ?? 0
    }
    
    func isShowLoadingCell(_ index: Int) -> Bool {
        if index == getRows() - 1 && currentPage >= manufacturerResponse?.totalPageCount ?? 0 {
            return false
        }
        
        if index == getRows() - 1 {
            return true
        }
        
        return false
    }
    

    func getNextData() {
        currentPage += 1
        getManufacturers()
    }
    
    
}
