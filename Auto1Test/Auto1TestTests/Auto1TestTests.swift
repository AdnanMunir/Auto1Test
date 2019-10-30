//
//  Auto1TestTests.swift
//  Auto1TestTests
//
//  Created by Adnan Munir on 17/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import XCTest
@testable import Auto1Test

class Auto1TestTests: XCTestCase {
    
    var testService : ModelService!
    var bmwTestModelResponse : ModelResponse!

    override func setUp() {
        super.setUp()
        testService = ModelService()
        setupModelResponse()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func setupModelResponse() {
        bmwTestModelResponse = ModelResponse(page: 0, pageSize: 1, totalPageCount: 21, wkda: [])
        let model = Model(id: "1er", name: "1er")
        bmwTestModelResponse.wkda?.append(model)
    }

    override func tearDown() {
        testService = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCarModels() {
       
        
        let promise = expectation(description: "Response Successful")
        var request = ModelRequest()
        request.pageNo = 0
        request.pageSize = 1
        request.manufacturer = "130" // id 130 is for BMW, in order to fail the test change the value of manufacturer
        
        testService.getModels(request) {[weak self] (result) in
            switch result {
            case .success(let response):
                XCTAssertEqual(response?.wkda?.first?.id, self?.bmwTestModelResponse.wkda?.first?.id)
                promise.fulfill()
                break
            case .failure(_):
                 XCTFail("Error: Expected Result was to get 1er model of BMW but it failed")
                break
            }
        }
    
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("Time Out occured : \(error)")
            }
        }
        
    }

}
