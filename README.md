
---

[![Unit Tests](https://github.com/gchriswill/OrSwift/actions/workflows/swift.yml/badge.svg)](https://github.com/gchriswill/OrSwift/actions/workflows/swift.yml)

---

```ASCII

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

```


## Overview

`Or` is a lightweight Swift library that provides convenient extensions for handling Optional values by offering sensible default values instead of `nil`. It transforms verbose optional unwrapping patterns into clean, readable code that's perfect for reactive and declarative programming styles.

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
let firstNameLength = optionalNames?.first.orEmpty.count
// Returns 0 (first element → nil empty string → count of 0)
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

## Requirements

- Swift 5.10+
- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+

## License

This project is available under the MIT license. See the LICENSE file for more info.

---

ASCII Art from `https://patorjk.com/software/taag/#p=display&f=Fraktur&t=Or%20Swift%0A`

---
