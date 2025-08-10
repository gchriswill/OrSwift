//
//  Or.swift
//  Or for Swift
//
//  Created by Christopher Gonzalez Melendez on 8/14/24.
//

// The Swift Programming Language
// https://docs.swift.org/swift-book

public let OrNameArt: String =

#"""

        ....                                ...                               .                   s    
    .x~X88888Hx.                        .x888888hx    :   x=~                @88>     oec :      :8    
   H8X 888888888h.      .u    .        d88888888888hxx   88x.   .e.   .e.    %8P     @88888     .88    
  8888:`*888888888:   .d88B :@8c      8" ... `"*8888%`  '8888X.x888:.x888     .      8"*88%    :888ooo 
  88888:        `%8  ="8888f8888r    !  "   ` .xnxx.     `8888  888X '888k  .@88u    8b.     -*8888888 
. `88888          ?>   4888>'88"     X X   .H8888888%:    X888  888X  888X ''888E`  u888888>   8888    
`. ?888%           X   4888> '       X 'hn8888888*"   >   X888  888X  888X   888E    8888R     8888    
  ~*??.            >   4888>         X: `*88888%`     !   X888  888X  888X   888E    8888P     8888    
 .x88888h.        <   .d888L .+      '8h.. ``     ..x8>  .X888  888X. 888~   888E    *888>    .8888Lu= 
:"""8888888x..  .x    ^"8888*"        `88888888888888f   `%88%``"*888Y"      888&    4888     ^%888*   
`    `*888888888"        "Y"           '%8888888888*"      `~     `"         R888"   '888       'Y"    
        ""***""                           ^"****""`                           ""      88R              
                                                                                      88>              
                                                                                      48               
                                                                                      '8               
                                                                                      88
"""#


// MARK: - Core

public protocol Orable {
    func or<T>(_ value: T) -> T
}

public extension Orable {
    
    // All value types covered
    func or<T>(_ value: T) -> T {
        return self as? T ?? value
    }
}

public protocol Thisable {
    static func this<T>(optional: T?, default defaultValue: T) -> T
}

public extension Thisable {
    
    // All value types covered
    static func this<T>(optional: T?, default defaultValue: T) -> T {
        return optional ?? defaultValue
    }
}


// MARK: Adoption

public final class Or: Thisable { private init(){} }
extension Optional: Orable {}


// MARK: - Extensions

extension Optional where Wrapped: StringProtocol {

    // All `StringProtocol` conforming types covered
    //
    // `String`
    // `Substring`
    
    @inlinable
    public var orEmpty: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return "" }
            return self
        }
    }
}

extension Optional where Wrapped == Bool {
    
    // All `Bool` possible results covered
    //
    // `true`
    // `false`
    
    @inlinable
    public var orTrue: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return true }
            return self
        }
    }
    
    @inlinable
    public var orFalse: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return false }
            return self
        }
    }
}

extension Optional where Wrapped: Numeric {
    
    // All `Numeric` conforming types covered
    //
    // `Double`
    // `Float`
    // `Float16`
    // `Float80`
    // `Int`
    // `Int128`
    // `Int16`
    // `Int32`
    // `Int64`
    // `Int8`
    // `UInt`
    // `UInt128`
    // `UInt16`
    // `UInt32`
    // `UInt64`
    // `UInt8`
    
    @inlinable
    public var orZero: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else { return .zero }
            return self
        }
    }
}

extension Optional where Wrapped: Collection {
    
    // All `Collection` possible results covered
    //
    // `Set`
    // `Array`
    // `Dictionary`
    
    @inlinable
    public var orEmpty: Wrapped {
        
        @inline(__always)
        
        get {
            
            guard let self = self else {
                
                if let emptySet = Set<AnyHashable>([]) as? Wrapped {
                    return emptySet
                } else if let emptyArray = [] as? Wrapped {
                    return emptyArray
                } else if let emptyDictionary = [:] as? Wrapped {
                    return emptyDictionary
                }
                
                fatalError("`orEmpty` is available for Set, Array and Dictionary collections.")
            }
            
            return self
        }
    }
}


