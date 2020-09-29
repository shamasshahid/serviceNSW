//
//  RegistrationDetailCellViewModelTests.swift
//  RegoAppTests
//
//  Created by Shamas on 29/9/20.
//

import XCTest
@testable import RegoApp

class RegistrationDetailCellViewModelTests: CommonTestCase {

    var viewModel: RegistrationDetailCellViewModel!
    
    override func setUpWithError() throws {
        if let model = getModel() {
            viewModel = RegistrationDetailCellViewModel(model: model)
        }
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testViewModel() throws {
        XCTAssertEqual(viewModel.plateNumber, "EBF28E")
        XCTAssertEqual(viewModel.makeModelDetail, "BLUE X4 M40I BMW WAGON")
        XCTAssertEqual(viewModel.expiryDate, "6 February 21")
        XCTAssertEqual(viewModel.vinDetail, "*******7324")
        XCTAssertEqual(viewModel.insurerName, "Allianz")
        XCTAssertEqual(viewModel.weight, "1700 Kg")
        XCTAssertEqual(viewModel.mass, "-")
    }
    
    func getModel() -> RegistrationElement? {
        let data = getData(name: "registrationsResponse")
        let registrations = try? JSONDecoder().decode(RegistrationsResponse.self, from: data)
        return registrations?.registrations.first
    }
}
