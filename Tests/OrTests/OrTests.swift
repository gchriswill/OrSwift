//
//  OrTests.swift
//  Or for Swift
//
//  Created by Christopher Gonzalez Melendez on 8/14/24.
//  Copyright © 2024 Christopher Gonzalez Melendez. All rights reserved.
//
//  Licensed under the MIT License.
//  See LICENSE file in the project root for full license information.
//

// The Swift Programming Language
// https://docs.swift.org/swift-book

import XCTest
@testable import Or

// XCTest Documentation
// https://developer.apple.com/documentation/xctest

// Defining Test Cases and Test Methods
// https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

final class OrTests: XCTestCase {
    
    func testOptionalString() throws {
        
        let failureMessage = "Test `testOptionalString` failed"
        
        let orValue: String = "This is an Or Value"
        
        let testVar1: String? = "Hello World"
        let testVar2: String? = nil
        
        XCTAssertFalse(testVar1.orEmpty.isEmpty, failureMessage)
        XCTAssertTrue(testVar2.orEmpty.isEmpty, failureMessage)
        XCTAssertTrue(testVar2.or(orValue) == orValue, failureMessage)
    }
    
    func testOptionalBool() throws {
       
        let failureMessage = "Test `testOptionalBool` failed"
        
        let orValue: Bool = true
        
        let testVar1: Bool? = true
        let testVar2: Bool? = nil
        
        XCTAssertTrue(testVar1.orTrue, failureMessage)
        XCTAssertFalse(testVar2.orFalse, failureMessage)
        XCTAssertTrue(testVar2.or(orValue), failureMessage)
    }
    
    func testOptionalInt() throws {
        
        let failureMessage = "Test `testOptionalInt` failed"
        
        let orValue1: Int = .zero
        let orValue2: Int = 1
        let orValue3: Int = 711
        
        let testVar1: Int? = 1
        let testVar2: Int? = nil
        
        XCTAssertTrue(testVar1.orZero == orValue2, failureMessage)
        XCTAssertTrue(testVar2.orZero == orValue1, failureMessage)
        XCTAssertTrue(testVar2.or(orValue3) == orValue3, failureMessage)
    }
    
    func testOptionalFloat() throws {
        
        let failureMessage = "Test `testOptionalFloat` failed"
        
        let orValue1: Float = .zero
        let orValue2: Float = 1.0
        let orValue3: Float = 711.0
        
        let testVar1: Float? = 1.0
        let testVar2: Float? = nil
        
        XCTAssertTrue(testVar1.orZero == orValue2, failureMessage)
        XCTAssertTrue(testVar2.orZero == orValue1, failureMessage)
        XCTAssertTrue(testVar2.or(orValue3) == orValue3, failureMessage)
    }
    
    func testOptionalDouble() throws {
        
        let failureMessage = "Test `testOptionalDouble` failed"
        
        let orValue1: Double = .zero
        let orValue2: Double = 1.0
        let orValue3: Double = 711.0
        
        let testVar1: Double? = 1.0
        let testVar2: Double? = nil
        
        XCTAssertTrue(testVar1.orZero == orValue2, failureMessage)
        XCTAssertTrue(testVar2.orZero == orValue1, failureMessage)
        XCTAssertTrue(testVar2.or(orValue3) == orValue3, failureMessage)
    }
    
    func testOptionalSet() throws {
        
        let failureMessage = "Test `testOptionalSet` failed"
        
        let orValue1: Set<String> = ["1","2","3"]
        
        let testVar1: Set<String>? = ["1","2","3"]
        let testVar2: Set<String>? = nil
        
        XCTAssertTrue(testVar1.orEmpty == orValue1, failureMessage)
        XCTAssertTrue(testVar2.orEmpty == [], failureMessage)
        XCTAssertTrue(testVar2.or(orValue1) == orValue1, failureMessage)
    }
    
    func testOptionalArray() throws {
        
        let failureMessage = "Test `testOptionalArray` failed"
        
        let orValue1: [String] = ["1","2","3"]
        
        let testVar1: [String]? = ["1","2","3"]
        let testVar2: [String]? = nil
        
        XCTAssertTrue(testVar1.orEmpty == orValue1, failureMessage)
        XCTAssertTrue(testVar2.orEmpty == [], failureMessage)
        XCTAssertTrue(testVar2.or(["3","2","1"]) == orValue1.reversed(), failureMessage)
    }
    
    func testOptionalDictionary() throws {
        
        let failureMessage = "Test `testOptionalDictionary` failed"
        
        let orValue1: [String: String] = ["1": "Hello", "2": "World"]
        
        let testVar1: [String: String]? = ["1": "Hello", "2": "World"]
        let testVar2: [String: String]? = nil
        
        XCTAssertTrue(testVar1.orEmpty == orValue1, failureMessage)
        XCTAssertTrue(testVar2.orEmpty == [:], failureMessage)
        XCTAssertTrue(testVar2.or(orValue1) == orValue1, failureMessage)
    }
    
    func testOrThis() throws {
        
        let failureMessage = "Test `OrThis` failed"
        
        let orValue1: [String: String] = ["1": "Hello", "2": "World"]
        let orValue2: [String: String] = ["1": "Bye"]
        
        let testVar1: [String: String]? = ["1": "Hello", "2": "World"]
        let testVar2: [String: String]? = nil
        
        XCTAssertTrue(Or.this(optional: testVar1, default: orValue1) == orValue1, failureMessage)
        XCTAssertTrue(Or.this(optional: testVar2, default: orValue2) == orValue2, failureMessage)
    }
    
    func testOptionalThisCustomObject() throws {
        
        // Covers Structure "Value" type
        struct ThisCustomTestObjectStructure: Thisable, Equatable {
            var identifier = "ThisCustomTestObject.Thisable.1"
        }
        
        let failureMessage1 = "Test `ThisCustomTestObject` failed"
        
        let orValue1: ThisCustomTestObjectStructure = ThisCustomTestObjectStructure()
        let orValue2: ThisCustomTestObjectStructure = ThisCustomTestObjectStructure(identifier: "ThisCustomTestObject.Thisable.2")
        
        let testVar1: ThisCustomTestObjectStructure? = ThisCustomTestObjectStructure()
        let testVar2: ThisCustomTestObjectStructure? = nil
        
        XCTAssertTrue(ThisCustomTestObjectStructure.this(optional: testVar1, default: orValue1) == orValue1, failureMessage1)
        XCTAssertTrue(ThisCustomTestObjectStructure.this(optional: testVar2, default: orValue1) == orValue1, failureMessage1)
        XCTAssertFalse(ThisCustomTestObjectStructure.this(optional: testVar1, default: orValue1) == orValue2, failureMessage1)
        
        // Covers Class "Reference" type
        class ThisCustomTestObjectClass: Equatable {
            
            var identifier: String
            
            init(identifier: String = "ThisCustomTestObject.Or.1") {
                self.identifier = identifier
            }
            
            static func == (lhs: ThisCustomTestObjectClass, rhs: ThisCustomTestObjectClass) -> Bool {
                lhs.identifier == rhs.identifier
            }
        }
        
        let failureMessage2 = "Test `ThisCustomTestObjectClass` failed"
        
        let orValue3: ThisCustomTestObjectClass = ThisCustomTestObjectClass()
        let orValue4: ThisCustomTestObjectClass = ThisCustomTestObjectClass(identifier: "ThisCustomTestObject.Or.2")
        
        let testVar3: ThisCustomTestObjectClass? = ThisCustomTestObjectClass()
        let testVar4: ThisCustomTestObjectClass? = nil
        
        XCTAssertTrue(testVar3.or(orValue3) == orValue3, failureMessage2)
        XCTAssertTrue(testVar4.or(orValue3) == orValue3, failureMessage2)
        XCTAssertFalse(testVar3.or(orValue3) == orValue4, failureMessage2)
    }
    
    func testOptionalOrCustomObject() throws {
        
        // Covers Structure "Value" type
        struct OrCustomTestObjectStructure: Equatable {
            var identifier = "OrCustomTestObject.Or.1"
        }
        
        let failureMessage1 = "Test `OrCustomTestObjectStructure` failed"
        
        let orValue1: OrCustomTestObjectStructure = OrCustomTestObjectStructure()
        let orValue2: OrCustomTestObjectStructure = OrCustomTestObjectStructure(identifier: "OrCustomTestObject.Or.2")
        
        let testVar1: OrCustomTestObjectStructure? = OrCustomTestObjectStructure()
        let testVar2: OrCustomTestObjectStructure? = nil
        
        XCTAssertTrue(testVar1.or(orValue1) == orValue1, failureMessage1)
        XCTAssertTrue(testVar2.or(orValue1) == orValue1, failureMessage1)
        XCTAssertFalse(testVar1.or(orValue1) == orValue2, failureMessage1)
        
        // Covers Class "Reference" type
        class OrCustomTestObjectClass: Equatable {
            
            var identifier: String
            
            init(identifier: String = "OrCustomTestObject.Or.1") {
                self.identifier = identifier
            }
            
            static func == (lhs: OrCustomTestObjectClass, rhs: OrCustomTestObjectClass) -> Bool {
                lhs.identifier == rhs.identifier
            }
        }
        
        let failureMessage2 = "Test `OrCustomTestObjectClass` failed"
        
        let orValue3: OrCustomTestObjectClass = OrCustomTestObjectClass()
        let orValue4: OrCustomTestObjectClass = OrCustomTestObjectClass(identifier: "OrCustomTestObject.Or.2")
        
        let testVar3: OrCustomTestObjectClass? = OrCustomTestObjectClass()
        let testVar4: OrCustomTestObjectClass? = nil
        
        XCTAssertTrue(testVar3.or(orValue3) == orValue3, failureMessage2)
        XCTAssertTrue(testVar4.or(orValue3) == orValue3, failureMessage2)
        XCTAssertFalse(testVar3.or(orValue3) == orValue4, failureMessage2)
    }
}
