//
//  Or.swift
//  Or for Swift
//
//  Created by Christopher Gonzalez Melendez on 8/14/24.
//

// The Swift Programming Language
// https://docs.swift.org/swift-book

public let OrNameArt: String =

"""

sSSs_sSSs     .S_sSSs           sSSs    sSSs_sSSs     .S_sSSs           sSSs   .S     S.    .S    sSSs  sdSS_SSSSSSbs
d%%SP~YS%%b   .SS~YS%%b         d%%SP.  d%%SP~YS%%b   .SS~YS%%b         d%%SP. .SS     SS.  .SS   d%%SP. YSSS~S%SSSSSP.
d%S'     `S%b  S%S   `S%b       d%S'    d%S'     `S%b  S%S   `S%b       d%S'    S%S     S%S  S%S  d%S'         S%S
S%S       S%S  S%S    S%S       S%S     S%S       S%S  S%S    S%S       S%|     S%S     S%S       S%S          S%S
S&S       S&S  S%S    d*S       S&S     S&S       S&S  S%S    d*S       S&S     S%S     S%S  S&S  S&S          S&S
S&S       S&S  S&S   .S*S       S&S_Ss  S&S       S&S  S&S   .S*S       Y&Ss    S&S     S&S  S&S  S&S_Ss       S&S
S&S       S&S  S&S_sdSSS        S&S~SP. S&S       S&S  S&S_sdSSS        `S&&S   S&S     S&S  S&S  S&S~SP.      S&S
S&S       S&S  S&S~YSY%b        S&S     S&S       S&S  S&S~YSY%b          `S*S  S&S     S&S  S&S  S&S          S&S
S*b       d*S  S*S   `S%b       S*b     S*b       d*S  S*S   `S%b          l*S  S*s  *  S*S  S*S  S*b          S*S
S*S.     .S*S  S*S    S%S       S*S     S*S.     .S*S  S*S    S%S         .S*P  S*s .s. S*S  S*S  S*S          S*S
SSSbs_sdSSS   S*S    S&S       S*S      SSSbs_sdSSS   S*S    S&S       sSS*S   S*S_sSs_S*S  S*S  S*S          S*S
YSSP~YSSY   .S*S    SSS      .S*S       YSSP~YSSY   .S*S    SSS       YSS'    SSS~SSS~S*S .S*S .S*S         .S*S
           sP               sP                     sP                                    sP   sP           sP
           Y                Y                      Y                                     Y    Y            Y

"""


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


