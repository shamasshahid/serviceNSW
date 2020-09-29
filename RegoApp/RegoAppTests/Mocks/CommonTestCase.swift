//
//  CommonTestCase.swift
//  RegoAppTests
//
//  Created by Shamas on 29/9/20.
//

import XCTest

class CommonTestCase: XCTestCase {
    
    func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }
}
