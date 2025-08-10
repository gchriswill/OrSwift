
---


```

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

```



`Or` supercharges optional bindings `?` and unwrapping by abstracting optional unwrapping logical conditions and providing defaults values instead of `nil`, which helps to ease and reduce complexity in a reactive and declarative setting.

## Overview

OrSwift is a lightweight Swift library that provides convenient extensions for handling Optional values by offering sensible default values instead of `nil`. It transforms verbose optional unwrapping patterns into clean, readable code that's perfect for reactive and declarative programming styles.

## Features

- 🚀 **Zero-cost abstractions** with `@inlinable` and `@inline(__always)` optimizations
- 🎯 **Type-safe** extensions for common Swift types
- 📝 **Intuitive API** with descriptive property names
- 🧪 **Comprehensive test coverage** ensuring reliability
- 🔧 **Protocol-oriented design** for extensibility

## Supported Types

### String Types
- `String` and `Substring` via `StringProtocol`
- Property: `.orEmpty` - Returns empty string for `nil` values

### Boolean Type
- `Bool` type support
- Properties: `.orTrue` and `.orFalse` - Returns respective boolean defaults

### Numeric Types
All `Numeric` protocol conforming types:
- `Int`, `Int8`, `Int16`, `Int32`, `Int64`, `Int128`
- `UInt`, `UInt8`, `UInt16`, `UInt32`, `UInt64`, `UInt128`
- `Double`, `Float`, `Float16`, `Float80`
- Property: `.orZero` - Returns `.zero` for `nil` values

### Collection Types
- `Array`, `Set`, `Dictionary`
- Property: `.orEmpty` - Returns appropriate empty collection for `nil` values

### Custom Types
- Generic `.or(_:)` method for any type
- Static `Or.this(optional:default:)` method for explicit handling

## Installation

### Swift Package Manager

Add OrSwift to your project by adding the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/gchriswill/OrSwift.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. Go to **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/gchriswill/OrSwift.git`
3. Click **Add Package**

## Usage

### Import the Library

```swift
import Or
```

### Basic Usage Examples

#### String Handling
```swift
let optionalName: String? = nil
let displayName = optionalName.orEmpty  // Returns ""

let optionalTitle: String? = "Hello World"
let title = optionalTitle.orEmpty       // Returns "Hello World"
```

#### Boolean Handling
```swift
let optionalFlag: Bool? = nil
let isEnabled = optionalFlag.orTrue     // Returns true
let isDisabled = optionalFlag.orFalse   // Returns false
```

#### Numeric Handling
```swift
let optionalCount: Int? = nil
let count = optionalCount.orZero        // Returns 0

let optionalPrice: Double? = nil
let price = optionalPrice.orZero        // Returns 0.0
```

#### Collection Handling
```swift
let optionalArray: [String]? = nil
let items = optionalArray.orEmpty       // Returns []

let optionalDict: [String: Int]? = nil
let dict = optionalDict.orEmpty         // Returns [:]

let optionalSet: Set<String>? = nil
let set = optionalSet.orEmpty           // Returns Set<String>()
```

#### Custom Types with Generic Methods
```swift
struct User {
    let name: String
}

let optionalUser: User? = nil
let defaultUser = User(name: "Guest")

// Using the .or() method
let user = optionalUser.or(defaultUser)

// Using the static Or.this() method
let user2 = Or.this(optional: optionalUser, default: defaultUser)
```

### Advanced Usage

#### Chaining Operations
```swift
let optionalNames: [String]? = nil
let firstNameLength = optionalNames.orEmpty.first.orEmpty.count
// Returns 0 (empty array → nil first element → empty string → count of 0)
```

#### In Reactive/Declarative Contexts
```swift
// SwiftUI example
struct ContentView: View {
    @State private var optionalText: String? = nil
    
    var body: some View {
        Text(optionalText.orEmpty)
            .foregroundColor(optionalText != nil ? .primary : .secondary)
    }
}

// Combine example
publisher
    .map { $0.optionalValue.orZero }
    .sink { value in
        print("Received: \(value)")
    }
```

## API Reference

### Protocols

#### `Orable`
```swift
public protocol Orable {
    func or<T>(_ value: T) -> T
}
```

#### `Thisable`
```swift
public protocol Thisable {
    static func this<T>(optional: T?, default defaultValue: T) -> T
}
```

### Extensions

#### `Optional where Wrapped: StringProtocol`
- `var orEmpty: Wrapped { get }`

#### `Optional where Wrapped == Bool`
- `var orTrue: Wrapped { get }`
- `var orFalse: Wrapped { get }`

#### `Optional where Wrapped: Numeric`
- `var orZero: Wrapped { get }`

#### `Optional where Wrapped: Collection`
- `var orEmpty: Wrapped { get }`

## Performance

OrSwift is designed for zero runtime overhead:
- All computed properties use `@inlinable` for compile-time optimization
- Getters are marked with `@inline(__always)` for maximum performance
- No additional memory allocations for default values

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is available under the MIT license. See the LICENSE file for more info.

## Requirements

- Swift 5.10+
- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
