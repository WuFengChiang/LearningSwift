//
//  LearningSwiftTests.swift
//  LearningSwiftTests
//
//  Created by wuufone on 2019/6/17.
//  Copyright © 2019 江武峯. All rights reserved.
//

import XCTest
@testable import LearningSwift

class LearningSwiftTests: XCTestCase {

    override func setUp() { }
    override func tearDown() { }

    func testIntExpression() {
        XCTAssertEqual(10000000, 1000_0000)
    }
}
