//
//  ModelVM.swift
//  Auto1Test
//
//  Created by Adnan Munir on 16/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

protocol ModelModeling {
    typealias updateViewAlias = () -> ()
    var updateView : updateViewAlias? {get set}
    
    func getModels()
    func getModel(at index : Int) -> Model?
    func getRows() -> Int
    func getNextData()
    func isShowLoadingCell(_ index : Int) -> Bool
    func modelSelected(at index : Int)
}


class ModelVM: ModelModeling {
    
    private let manufacturer : Manufacturer?
    
    init(_ manufacturer : Manufacturer?) {
        self.manufacturer = manufacturer
    }
    
    var updateView: ModelModeling.updateViewAlias?
    private let modelService = ModelService()
    private var modelResponse : ModelResponse?
    private var currentPage = 1
    private var models : [Model]?
    
    func getModels() {
        
         if currentPage > modelResponse?.totalPageCount ?? 1 {return} //to stop extra Network calls while scrolling
        
        var request = ModelRequest()
        request.pageNo = currentPage - 1 // as pages start from 0
        request.pageSize = C.pageSize
        request.manufacturer = manufacturer?.id
        
        modelService.getModels(request) {[weak self] (result) in
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
    
    private func configureResponse(response : ModelResponse?) {
        if currentPage == 1 { // If first page then initialize the array
            models = [Model]()
        }
        modelResponse = response
        models?.append(contentsOf: response?.wkda ?? [])
        updateView?()
    }
    
    func getModel(at index: Int) -> Model? {
        return models?[index]
    }
    
    func getRows() -> Int {
        
        if currentPage < modelResponse?.totalPageCount ?? 0 {
            return (models?.count ?? 0) + 1 // To show last loading cell
        }
        
        return models?.count ?? 0
    }
    
    func isShowLoadingCell(_ index: Int) -> Bool {
        if index == getRows() - 1 && currentPage >= modelResponse?.totalPageCount ?? 0 {
            return false
        }
        
        if index == getRows() - 1 {
            return true
        }
        
        return false
    }
    
    
    func getNextData() {
        currentPage += 1
        getModels()
    }
    
    func modelSelected(at index: Int) {
        let str = "\(manufacturer!.name!) \(getModel(at: index)!.name!)"
        AppAlerts.showAlert(message: str)
    }
    
    
}
