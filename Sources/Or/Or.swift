//
//  Or.swift
//  Or for Swift
//
//  Created by Christopher Gonzalez Melendez on 8/14/24.
//  Copyright © 2025 Christopher Gonzalez Melendez. All rights reserved.
//
//  Licensed under the MIT License.
//  See LICENSE file in the project root for full license information.
//

// The Swift Programming Language
// https://docs.swift.org/swift-book

public let OrNameArt: String =

#"""

        ....                               ...                               .                  s    
    .x~X88888Hx.                       .x888888hx    :   x=~                @88>    oec :      :8    
   H8X 888888888h.      .u    .       d88888888888hxx   88x.   .e.   .e.    %8P    @88888     .88    
  8888:`*888888888:   .d88B :@8c     8" ... `"*8888%`  '8888X.x888:.x888     .     8"*88%    :888ooo 
  88888:        `%8  ="8888f8888r   !  "   ` .xnxx.     `8888  888X '888k  .@88u   8b.     -*8888888 
. `88888          ?>   4888>'88"    X X   .H8888888%:    X888  888X  888X ''888E` u888888>   8888    
`. ?888%           X   4888> '      X 'hn8888888*"   >   X888  888X  888X   888E   8888R     8888    
  ~*??.            >   4888>        X: `*88888%`     !   X888  888X  888X   888E   8888P     8888    
 .x88888h.        <   .d888L .+     '8h.. ``     ..x8>  .X888  888X. 888~   888E   *888>    .8888Lu= 
:"""8888888x..  .x    ^"8888*"       `88888888888888f   `%88%``"*888Y"      888&   4888     ^%888*   
`    `*888888888"        "Y"          '%8888888888*"      `~     `"         R888"  '888       'Y"    
        ""***""                          ^"****""`                           ""     88R              
                                                                                    88>              
                                                                                    48               
                                                                                    '8               

"""#


// MARK: - Core

/// A protocol that provides convenient methods for handling optional values by offering fallback alternatives.
///
/// Types conforming to `Orable` gain access to the `or(_:)` method, which returns the unwrapped value
/// if it exists, or the provided fallback value if the original value is `nil`.
///
/// ## Example Usage
/// ```swift
/// let optionalName: String? = nil
/// let displayName = optionalName.or("Guest User")
/// // displayName is "Guest User"
/// ```
public protocol Orable {
    /// Returns the unwrapped value if it exists, otherwise returns the provided fallback value.
    ///
    /// - Parameter value: The fallback value to return if `self` is `nil`
    /// - Returns: The unwrapped value or the fallback value
    func or<T>(_ value: T) -> T
}

public extension Orable {
    
    /// Default implementation of the `or(_:)` method for all value types.
    ///
    /// This method attempts to cast `self` to type `T`. If the cast succeeds,
    /// it returns the casted value. If the cast fails (typically when `self` is `nil`),
    /// it returns the provided fallback value.
    ///
    /// - Parameter value: The fallback value to return if casting fails
    /// - Returns: The casted value or the fallback value
    ///
    /// ## Example
    /// ```swift
    /// let optionalNumber: Int? = nil
    /// let result = optionalNumber.or(42)
    /// // result is 42
    /// ```
    func or<T>(_ value: T) -> T {
        return self as? T ?? value
    }
}

/// A protocol that provides static methods for explicit optional handling with default values.
///
/// Types conforming to `Thisable` gain access to the `this(optional:default:)` static method,
/// which provides an explicit way to handle optional values with fallback defaults.
///
/// ## Example Usage
/// ```swift
/// struct User: Thisable {}
/// 
/// let optionalUser: User? = nil
/// let defaultUser = User()
/// let result = User.this(optional: optionalUser, default: defaultUser)
/// // result is defaultUser
/// ```
public protocol Thisable {
    /// Returns the optional value if it exists, otherwise returns the provided default value.
    ///
    /// - Parameters:
    ///   - optional: The optional value to unwrap
    ///   - defaultValue: The default value to return if the optional is `nil`
    /// - Returns: The unwrapped optional value or the default value
    static func this<T>(optional: T?, default defaultValue: T) -> T
}

public extension Thisable {
    
    /// Default implementation of the `this(optional:default:)` method for all value types.
    ///
    /// This method provides a straightforward way to unwrap optional values with explicit defaults.
    /// It uses Swift's nil-coalescing operator (`??`) internally for optimal performance.
    ///
    /// - Parameters:
    ///   - optional: The optional value to unwrap
    ///   - defaultValue: The default value to return if the optional is `nil`
    /// - Returns: The unwrapped optional value or the default value
    ///
    /// ## Example
    /// ```swift
    /// let optionalScore: Int? = nil
    /// let score = MyType.this(optional: optionalScore, default: 0)
    /// // score is 0
    /// ```
    static func this<T>(optional: T?, default defaultValue: T) -> T {
        return optional ?? defaultValue
    }
}


// MARK: Adoption

/// A utility class that provides static methods for optional handling.
///
/// The `Or` class serves as a namespace for static utility methods and conforms to `Thisable`
/// to provide convenient access to the `this(optional:default:)` method without requiring
/// a specific type to conform to the protocol.
///
/// ## Example Usage
/// ```swift
/// let optionalValue: String? = nil
/// let result = Or.this(optional: optionalValue, default: "Default")
/// // result is "Default"
/// ```
///
/// - Note: This class cannot be instantiated as it has a private initializer.
public final class Or: Thisable { 
    /// Private initializer prevents instantiation of this utility class.
    private init(){} 
}

/// Extends all Optional types to conform to `Orable`, providing the `or(_:)` method.
///
/// This extension automatically makes the `or(_:)` method available on all optional values,
/// enabling convenient fallback value assignment without explicit unwrapping.
extension Optional: Orable {}


// MARK: - Extensions

/// Extension for Optional types wrapping StringProtocol-conforming values.
///
/// Provides convenient access to empty string defaults for optional string values.
/// Supports all types conforming to `StringProtocol`, including `String` and `Substring`.
extension Optional where Wrapped: StringProtocol {

    /// Returns the string value if it exists, otherwise returns an empty string.
    ///
    /// This computed property provides a clean way to handle optional strings by returning
    /// an empty string when the optional is `nil`, eliminating the need for explicit
    /// nil-coalescing operations.
    ///
    /// ## Supported Types
    /// - `String`
    /// - `Substring`
    /// - Any type conforming to `StringProtocol`
    ///
    /// ## Example Usage
    /// ```swift
    /// let optionalName: String? = nil
    /// let displayName = optionalName.orEmpty  // Returns ""
    ///
    /// let optionalTitle: String? = "Hello World"
    /// let title = optionalTitle.orEmpty       // Returns "Hello World"
    /// ```
    ///
    /// - Returns: The string value if not `nil`, otherwise an empty string
    /// - Complexity: O(1)
    @inlinable
    public var orEmpty: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return "" }
            return self
        }
    }
}

/// Extension for Optional Boolean values.
///
/// Provides convenient access to boolean defaults for optional boolean values.
/// Offers both `orTrue` and `orFalse` properties for different default behaviors.
extension Optional where Wrapped == Bool {
    
    /// Returns the boolean value if it exists, otherwise returns `true`.
    ///
    /// This computed property is useful when you want to default to `true` for `nil` boolean values,
    /// commonly used for feature flags or permission checks where the default should be enabled.
    ///
    /// ## Example Usage
    /// ```swift
    /// let optionalFlag: Bool? = nil
    /// let isEnabled = optionalFlag.orTrue     // Returns true
    ///
    /// let optionalSetting: Bool? = false
    /// let setting = optionalSetting.orTrue    // Returns false
    /// ```
    ///
    /// - Returns: The boolean value if not `nil`, otherwise `true`
    /// - Complexity: O(1)
    @inlinable
    public var orTrue: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return true }
            return self
        }
    }
    
    /// Returns the boolean value if it exists, otherwise returns `false`.
    ///
    /// This computed property is useful when you want to default to `false` for `nil` boolean values,
    /// commonly used for feature flags or permission checks where the default should be disabled.
    ///
    /// ## Example Usage
    /// ```swift
    /// let optionalFlag: Bool? = nil
    /// let isDisabled = optionalFlag.orFalse   // Returns false
    ///
    /// let optionalSetting: Bool? = true
    /// let setting = optionalSetting.orFalse   // Returns true
    /// ```
    ///
    /// - Returns: The boolean value if not `nil`, otherwise `false`
    /// - Complexity: O(1)
    @inlinable
    public var orFalse: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return false }
            return self
        }
    }
}

/// Extension for Optional Numeric values.
///
/// Provides convenient access to zero defaults for optional numeric values.
/// Supports all types conforming to the `Numeric` protocol.
extension Optional where Wrapped: Numeric {
    
    /// Returns the numeric value if it exists, otherwise returns zero.
    ///
    /// This computed property provides a clean way to handle optional numeric values by returning
    /// the appropriate zero value when the optional is `nil`. The zero value is determined by
    /// the `Numeric` protocol's `.zero` property.
    ///
    /// ## Supported Types
    /// All `Numeric` protocol conforming types including:
    /// - **Integers**: `Int`, `Int8`, `Int16`, `Int32`, `Int64`, `Int128`
    /// - **Unsigned Integers**: `UInt`, `UInt8`, `UInt16`, `UInt32`, `UInt64`, `UInt128`
    /// - **Floating Point**: `Double`, `Float`, `Float16`, `Float80`
    ///
    /// ## Example Usage
    /// ```swift
    /// let optionalCount: Int? = nil
    /// let count = optionalCount.orZero        // Returns 0
    ///
    /// let optionalPrice: Double? = nil
    /// let price = optionalPrice.orZero        // Returns 0.0
    ///
    /// let optionalAge: Int? = 25
    /// let age = optionalAge.orZero            // Returns 25
    /// ```
    ///
    /// - Returns: The numeric value if not `nil`, otherwise the appropriate zero value
    /// - Complexity: O(1)
    @inlinable
    public var orZero: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return .zero }
            return self
        }
    }
}

/// Extension for Optional Collection values.
///
/// Provides convenient access to empty collection defaults for optional collection values.
/// Supports common collection types including `Array`, `Set`, and `Dictionary`.
extension Optional where Wrapped: Collection {
    
    /// Returns the collection if it exists, otherwise returns an appropriate empty collection.
    ///
    /// This computed property provides a clean way to handle optional collections by returning
    /// an empty collection of the same type when the optional is `nil`. The method uses type
    /// casting to determine the appropriate empty collection type.
    ///
    /// ## Supported Collection Types
    /// - `Array<Element>` - Returns `[]`
    /// - `Set<Element>` - Returns `Set<Element>()`
    /// - `Dictionary<Key, Value>` - Returns `[:]`
    ///
    /// ## Example Usage
    /// ```swift
    /// let optionalArray: [String]? = nil
    /// let items = optionalArray.orEmpty       // Returns []
    ///
    /// let optionalDict: [String: Int]? = nil
    /// let dict = optionalDict.orEmpty         // Returns [:]
    ///
    /// let optionalSet: Set<String>? = nil
    /// let set = optionalSet.orEmpty           // Returns Set<String>()
    ///
    /// // Chaining operations
    /// let count = optionalArray.orEmpty.count // Returns 0
    /// ```
    ///
    /// - Returns: The collection if not `nil`, otherwise an appropriate empty collection
    /// - Complexity: O(1)
    ///
    /// - Important: This method supports `Set`, `Array`, and `Dictionary` collections.
    ///   Using it with unsupported collection types will result in a runtime error.
    @inlinable
    public var orEmpty: Wrapped {
        
        @inline(__always)

        get {

            guard let self = self else {
                // Optimized: Check most common types first for better branch prediction
                if let emptyArray = [] as? Wrapped {
                    return emptyArray
                } else if let emptyDictionary = [:] as? Wrapped {
                    return emptyDictionary
                } else if let emptySet = Set<AnyHashable>([]) as? Wrapped {
                    return emptySet
                }

                fatalError("`orEmpty` is only available for Set, Array and Dictionary collections.")
            }
            
            return self
        }
    }
}


