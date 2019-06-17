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
        XCTAssertEqual(10000000, 1.0e7)
        XCTAssertEqual(16, 0b10000)
        XCTAssertEqual(16, 0o20)
        XCTAssertEqual(16, 0x10)
        XCTAssertEqual(16, 0x1p4)
    }
}
