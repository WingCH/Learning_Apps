//
//  DogYearsTests.swift
//  DogYearsTests
//
//  Created by WingCH on 23/10/2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest
@testable import DogYears

class DogYearsTests: XCTestCase {
    
    let calc = Calculator()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() {
        let result = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
        XCTAssert(result == 11.0, "Calculator add operation failed")
    }
    
    func testSubtract() {
        let result = calc.evaluate(op: "−", arg1: 9.0, arg2: 2.0)
        XCTAssert(result == 7.0, "Calculator subtraction operation failed")
    }
    
    func testResult() {
        let res1 = calc.evaluate(op: "+", arg1: 2.0, arg2: 2.0)
        let res2 = calc.result
        XCTAssert(res1 == res2, "Calculator displayed result does not match calculation result")
    }


}
