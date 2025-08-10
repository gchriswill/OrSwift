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

/// Comprehensive test suite for the OrSwift library.
///
/// This test class validates all functionality provided by the OrSwift library, including:
/// - Optional string handling with `orEmpty`
/// - Optional boolean handling with `orTrue` and `orFalse`  
/// - Optional numeric handling with `orZero`
/// - Optional collection handling with `orEmpty`
/// - Generic optional handling with `or(_:)` method
/// - Static optional handling with `Or.this(optional:default:)`
/// - Custom object support for both structs and classes
///
/// ## Test Coverage
/// - All primitive Swift types (String, Bool, Int, Float, Double)
/// - All major collection types (Array, Set, Dictionary)
/// - Custom value types (structs) and reference types (classes)
/// - Both instance methods and static utility methods
///
/// ## Usage
/// Run tests using:
/// ```bash
/// swift test
/// ```
final class OrTests: XCTestCase {
    
    /// Tests optional String handling with the `orEmpty` property.
    ///
    /// Validates that:
    /// - Non-nil optional strings return their original value
    /// - Nil optional strings return an empty string
    /// - The generic `or(_:)` method works correctly with string values
    ///
    /// ## Test Cases
    /// - `String?` with value "Hello World" returns "Hello World"
    /// - `String?` with nil value returns ""
    /// - Generic fallback with custom string value
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOptionalString() throws {
        
        let failureMessage = "Test `testOptionalString` failed"
        
        let orValue: String = "This is an Or Value"
        
        let testVar1: String? = "Hello World"
        let testVar2: String? = nil
        
        XCTAssertFalse(testVar1.orEmpty.isEmpty, failureMessage)
        XCTAssertTrue(testVar2.orEmpty.isEmpty, failureMessage)
        XCTAssertTrue(testVar2.or(orValue) == orValue, failureMessage)
    }
    
    /// Tests optional Bool handling with `orTrue` and `orFalse` properties.
    ///
    /// Validates that:
    /// - Non-nil optional booleans return their original value
    /// - Nil optional booleans return appropriate defaults (`true` for `orTrue`, `false` for `orFalse`)
    /// - The generic `or(_:)` method works correctly with boolean values
    ///
    /// ## Test Cases
    /// - `Bool?` with value `true` using `orTrue` returns `true`
    /// - `Bool?` with nil value using `orFalse` returns `false`
    /// - Generic fallback with custom boolean value
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOptionalBool() throws {
       
        let failureMessage = "Test `testOptionalBool` failed"
        
        let orValue: Bool = true
        
        let testVar1: Bool? = true
        let testVar2: Bool? = nil
        
        XCTAssertTrue(testVar1.orTrue, failureMessage)
        XCTAssertFalse(testVar2.orFalse, failureMessage)
        XCTAssertTrue(testVar2.or(orValue), failureMessage)
    }
    
    /// Tests optional Int handling with the `orZero` property.
    ///
    /// Validates that:
    /// - Non-nil optional integers return their original value
    /// - Nil optional integers return zero
    /// - The generic `or(_:)` method works correctly with integer values
    ///
    /// ## Test Cases
    /// - `Int?` with value `1` returns `1`
    /// - `Int?` with nil value returns `0`
    /// - Generic fallback with custom integer value (`711`)
    ///
    /// - Throws: `XCTestError` if any assertion fails
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
    
    /// Tests optional Float handling with the `orZero` property.
    ///
    /// Validates that:
    /// - Non-nil optional floats return their original value
    /// - Nil optional floats return zero (0.0)
    /// - The generic `or(_:)` method works correctly with float values
    ///
    /// ## Test Cases
    /// - `Float?` with value `1.0` returns `1.0`
    /// - `Float?` with nil value returns `0.0`
    /// - Generic fallback with custom float value (`711.0`)
    ///
    /// - Throws: `XCTestError` if any assertion fails
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
    
    /// Tests optional Double handling with the `orZero` property.
    ///
    /// Validates that:
    /// - Non-nil optional doubles return their original value
    /// - Nil optional doubles return zero (0.0)
    /// - The generic `or(_:)` method works correctly with double values
    ///
    /// ## Test Cases
    /// - `Double?` with value `1.0` returns `1.0`
    /// - `Double?` with nil value returns `0.0`
    /// - Generic fallback with custom double value (`711.0`)
    ///
    /// - Throws: `XCTestError` if any assertion fails
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
    
    /// Tests optional Set handling with the `orEmpty` property.
    ///
    /// Validates that:
    /// - Non-nil optional sets return their original value
    /// - Nil optional sets return an empty set
    /// - The generic `or(_:)` method works correctly with set values
    ///
    /// ## Test Cases
    /// - `Set<String>?` with values `["1","2","3"]` returns the original set
    /// - `Set<String>?` with nil value returns empty set `[]`
    /// - Generic fallback with custom set value
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOptionalSet() throws {
        
        let failureMessage = "Test `testOptionalSet` failed"
        
        let orValue1: Set<String> = ["1","2","3"]
        
        let testVar1: Set<String>? = ["1","2","3"]
        let testVar2: Set<String>? = nil
        
        XCTAssertTrue(testVar1.orEmpty == orValue1, failureMessage)
        XCTAssertTrue(testVar2.orEmpty == [], failureMessage)
        XCTAssertTrue(testVar2.or(orValue1) == orValue1, failureMessage)
    }
    
    /// Tests optional Array handling with the `orEmpty` property.
    ///
    /// Validates that:
    /// - Non-nil optional arrays return their original value
    /// - Nil optional arrays return an empty array
    /// - The generic `or(_:)` method works correctly with array values
    /// - Array ordering is preserved in comparisons
    ///
    /// ## Test Cases
    /// - `[String]?` with values `["1","2","3"]` returns the original array
    /// - `[String]?` with nil value returns empty array `[]`
    /// - Generic fallback with reversed array demonstrates ordering preservation
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOptionalArray() throws {
        
        let failureMessage = "Test `testOptionalArray` failed"
        
        let orValue1: [String] = ["1","2","3"]
        
        let testVar1: [String]? = ["1","2","3"]
        let testVar2: [String]? = nil
        
        XCTAssertTrue(testVar1.orEmpty == orValue1, failureMessage)
        XCTAssertTrue(testVar2.orEmpty == [], failureMessage)
        XCTAssertTrue(testVar2.or(["3","2","1"]) == orValue1.reversed(), failureMessage)
    }
    
    /// Tests optional Dictionary handling with the `orEmpty` property.
    ///
    /// Validates that:
    /// - Non-nil optional dictionaries return their original value
    /// - Nil optional dictionaries return an empty dictionary
    /// - The generic `or(_:)` method works correctly with dictionary values
    ///
    /// ## Test Cases
    /// - `[String: String]?` with values `["1": "Hello", "2": "World"]` returns the original dictionary
    /// - `[String: String]?` with nil value returns empty dictionary `[:]`
    /// - Generic fallback with custom dictionary value
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOptionalDictionary() throws {
        
        let failureMessage = "Test `testOptionalDictionary` failed"
        
        let orValue1: [String: String] = ["1": "Hello", "2": "World"]
        
        let testVar1: [String: String]? = ["1": "Hello", "2": "World"]
        let testVar2: [String: String]? = nil
        
        XCTAssertTrue(testVar1.orEmpty == orValue1, failureMessage)
        XCTAssertTrue(testVar2.orEmpty == [:], failureMessage)
        XCTAssertTrue(testVar2.or(orValue1) == orValue1, failureMessage)
    }
    
    /// Tests the static `Or.this(optional:default:)` method functionality.
    ///
    /// Validates that:
    /// - The static method correctly handles non-nil optional values
    /// - The static method returns the default value for nil optionals
    /// - The method works with any type (demonstrated with Dictionary)
    ///
    /// ## Test Cases
    /// - Non-nil `[String: String]?` returns the original dictionary
    /// - Nil `[String: String]?` returns the provided default dictionary
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOrThis() throws {
        
        let failureMessage = "Test `OrThis` failed"
        
        let orValue1: [String: String] = ["1": "Hello", "2": "World"]
        let orValue2: [String: String] = ["1": "Bye"]
        
        let testVar1: [String: String]? = ["1": "Hello", "2": "World"]
        let testVar2: [String: String]? = nil
        
        XCTAssertTrue(Or.this(optional: testVar1, default: orValue1) == orValue1, failureMessage)
        XCTAssertTrue(Or.this(optional: testVar2, default: orValue2) == orValue2, failureMessage)
    }
    
    /// Tests custom object support with the `Thisable` protocol and static methods.
    ///
    /// Validates that:
    /// - Custom structs (value types) work correctly with `Thisable` protocol
    /// - Custom classes (reference types) work correctly with `Orable` protocol  
    /// - Both nil and non-nil scenarios are handled properly
    /// - Custom objects maintain their identity and equality semantics
    ///
    /// ## Test Coverage
    /// **Struct (Value Type) Tests:**
    /// - Tests `ThisCustomTestObjectStructure` conforming to `Thisable`
    /// - Validates static `this(optional:default:)` method functionality
    /// - Tests custom identifier preservation and equality
    ///
    /// **Class (Reference Type) Tests:**
    /// - Tests `ThisCustomTestObjectClass` with `Equatable` conformance
    /// - Validates instance `or(_:)` method functionality through `Orable` protocol
    /// - Tests custom identifier preservation and equality semantics
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOptionalThisCustomObject() throws {
        
        /// A test structure demonstrating `Thisable` protocol conformance.
        ///
        /// This struct is used to validate that custom value types can successfully
        /// conform to the `Thisable` protocol and utilize the static `this(optional:default:)`
        /// method for optional handling.
        ///
        /// - Note: Conforms to both `Thisable` and `Equatable` for comprehensive testing
        struct ThisCustomTestObjectStructure: Thisable, Equatable {
            /// Unique identifier for distinguishing different instances in tests
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
        
        /// A test class demonstrating optional handling with reference types.
        ///
        /// This class is used to validate that custom reference types can successfully
        /// utilize the `or(_:)` method through the `Orable` protocol (via Optional extension)
        /// for optional handling scenarios.
        ///
        /// - Note: Conforms to `Equatable` to enable value comparison in tests
        class ThisCustomTestObjectClass: Equatable {
            
            /// Unique identifier for distinguishing different instances in tests
            var identifier: String
            
            /// Initializes a new instance with an optional custom identifier
            /// - Parameter identifier: The identifier string (defaults to "ThisCustomTestObject.Or.1")
            init(identifier: String = "ThisCustomTestObject.Or.1") {
                self.identifier = identifier
            }
            
            /// Compares two instances based on their identifier values
            /// - Parameters:
            ///   - lhs: Left-hand side instance to compare
            ///   - rhs: Right-hand side instance to compare
            /// - Returns: `true` if both instances have the same identifier, `false` otherwise
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
    
    /// Tests custom object support with the `or(_:)` method from `Orable` protocol.
    ///
    /// Validates that:
    /// - Custom structs (value types) work correctly with `or(_:)` method
    /// - Custom classes (reference types) work correctly with `or(_:)` method
    /// - Both nil and non-nil scenarios are handled properly for custom objects
    /// - Custom objects maintain their identity and equality semantics
    ///
    /// ## Test Coverage
    /// **Struct (Value Type) Tests:**
    /// - Tests `OrCustomTestObjectStructure` with instance `or(_:)` method
    /// - Validates optional handling through `Orable` protocol extension
    /// - Tests custom identifier preservation and equality
    ///
    /// **Class (Reference Type) Tests:**
    /// - Tests `OrCustomTestObjectClass` with instance `or(_:)` method
    /// - Validates optional handling through `Orable` protocol extension
    /// - Tests custom identifier preservation and equality semantics
    ///
    /// - Throws: `XCTestError` if any assertion fails
    func testOptionalOrCustomObject() throws {
        
        /// A test structure demonstrating `or(_:)` method usage with custom value types.
        ///
        /// This struct is used to validate that custom value types can successfully
        /// utilize the `or(_:)` method through the `Orable` protocol (via Optional extension)
        /// for optional handling scenarios.
        ///
        /// - Note: Conforms to `Equatable` to enable value comparison in tests
        struct OrCustomTestObjectStructure: Equatable {
            /// Unique identifier for distinguishing different instances in tests
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
        
        /// A test class demonstrating `or(_:)` method usage with custom reference types.
        ///
        /// This class is used to validate that custom reference types can successfully
        /// utilize the `or(_:)` method through the `Orable` protocol (via Optional extension)
        /// for optional handling scenarios.
        ///
        /// - Note: Conforms to `Equatable` to enable value comparison in tests
        class OrCustomTestObjectClass: Equatable {
            
            /// Unique identifier for distinguishing different instances in tests
            var identifier: String
            
            /// Initializes a new instance with an optional custom identifier
            /// - Parameter identifier: The identifier string (defaults to "OrCustomTestObject.Or.1")
            init(identifier: String = "OrCustomTestObject.Or.1") {
                self.identifier = identifier
            }
            
            /// Compares two instances based on their identifier values
            /// - Parameters:
            ///   - lhs: Left-hand side instance to compare
            ///   - rhs: Right-hand side instance to compare
            /// - Returns: `true` if both instances have the same identifier, `false` otherwise
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
