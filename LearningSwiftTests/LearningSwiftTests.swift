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
    
    func testTypeInference() {
        let integer1 = 7
        let integer2: Int = 8
        XCTAssertTrue(type(of: integer1) == type(of: integer2))
        
        let float1 = 1.0
        let float2: Float = 1.0
        let float3: Double = 1.0
        XCTAssertFalse(type(of: float1) == type(of: float2))
        XCTAssertTrue(type(of: float1) == type(of: float3))
    }
    
    func testMaxInt() {
        XCTAssertEqual(9223372036854775807, Int.max)
    }
    
    func testIfElse() {
        let score = 55
        func functionWithIfElse() -> String {
            if score < 40 {
                return "死當"
            } else if score >= 40, score < 60 {
                return "活當"
            } else {
                return "pass"
            }
        }
        XCTAssertEqual(functionWithIfElse(), "活當")
    }
    
    func testSwitch() {
        let score = 55
        func functionWithSwitch() -> String {
            switch score {
            case 0...39:
                return "死當"
            case 40...59:
                return "活當"
            default:
                return "pass"
            }
        }
        XCTAssertEqual(functionWithSwitch(), "活當")
    }
    
    func testArrayRevese() {
        let avengers = ["Iron man",
                        "American captain",
                        "Thor"]
        let reversedAvengers = ["Thor",
                                "American captain",
                                "Iron man"]
        let disorderAvengers = ["American captain",
                                "Thor",
                                "Iron man"]
        XCTAssertEqual(avengers.reversed(), reversedAvengers)
        XCTAssertTrue(avengers.reversed() != disorderAvengers)   
    }
}
