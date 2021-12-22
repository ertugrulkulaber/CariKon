//
//  GMStepperExampleTests.swift
//  GMStepperExampleTests
//
//  Created by Gunay Mert Karadogan on 4/7/15.
//  Copyright (c) 2015 Gunay Mert Karadogan. All rights reserved.
//

import XCTest
import UIKit

class GMStepperExampleTests: XCTestCase {
    var stepper: GMStepper!

    override func setUp() {
        super.setUp()
        stepper = GMStepper()
    }

    func testDefaults() {
        XCTAssert(stepper.minimumValue == 0, "minimumValue defaults 0")
        XCTAssert(stepper.maximumValue == 100, "maximumValue defaults to 100")
        XCTAssert(stepper.value == 0, "value defaults to 0")
    }

    func testMinimum_limitsValue() {
        stepper.minimumValue = 1
        stepper.value = 0

        XCTAssert(stepper.value == stepper.minimumValue, "Pass")
    }

    func testMaximum_limitsValue() {
        let stepper = GMStepper()
        stepper.maximumValue = 1
        stepper.value = 2

        XCTAssert(stepper.value == stepper.maximumValue, "Pass")
    }
    
    
}
