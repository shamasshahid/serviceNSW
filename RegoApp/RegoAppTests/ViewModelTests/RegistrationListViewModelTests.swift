//
//  RegistrationListViewModelTests.swift
//  RegoAppTests
//
//  Created by Shamas on 29/9/20.
//

import XCTest
@testable import RegoApp

class RegistrationListViewModelTests: XCTestCase {

    var viewModel: RegistrationsListViewModel!
    override func setUpWithError() throws {
        viewModel = RegistrationsListViewModel(router: MockProvider.getRouter(), service: MockProvider.getService())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testViewModel() throws {
        
        let updateExpection = XCTestExpectation()
        
        viewModel.onDataUpdated = {
            updateExpection.fulfill()
        }
        viewModel.requestData()
        wait(for: [updateExpection], timeout: 5)
        XCTAssertEqual(viewModel.rowCount, 1)
        
        let registrationDetailVM = viewModel.getRegistrationDetailViewModel(index: 0)
        XCTAssertNotNil(registrationDetailVM)
        
        let regisrationRowVM = viewModel.getRegistrationViewModel(index: 0)
        XCTAssertNotNil(regisrationRowVM)
    }

}
