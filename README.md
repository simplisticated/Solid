<p align="center" >
<img src="https://github.com/igormatyushkin014/Solid/blob/master/Logo/logo-1024-300.png" alt="Solid" title="Solid">
</p>

<p align="center">
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Solid.svg?maxAge=2592000"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/Solid.svg?maxAge=2592000"></a>
<a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

# At a Glance

The main purpose of this library is to make selections from arrays in Swift more clear and efficient.

##How To Get Started

- Copy content of `Solid` folder to your project.

or

- Use `Solid` cocoapod

## Requirements

* iOS 9.0 and later
* Xcode 8 and later

**Note**: For Swift 2.x use `Solid v1.2.3`. For Swift 3.0 use `Solid v3.0`.

## Usage

```swift
let sourceArray = [1, 5, 10, 128, 256, 1024, 2048, 4096, 8000, 8390]

let selection1 = (sourceArray as NSArray)
    .beginQuery()    // Each query should begin with this call

    .skip(2)         // Removes first two elements from result selection
                     // Temporary result: [10, 128, 256, 1024, 2048, 4096, 8000, 8390]

    .take(3)         // Removes all elements but first three from result selection
                     // Temporary result: [10, 128, 256]

    .endQuery()      // This method returns result of selection
                     // In current case, result is an array equal to [10, 128, 256]


let selection2 = (sourceArray as NSArray)
    .beginQuery()
    .skip(4)         // Temporary result: [256, 1024, 2048, 4096, 8000, 8390]
    .take(2)         // Temporary result: [256, 1024]
    .contains({
        // Checks whether at least one element is more than 300
        ($0 as! Int) > 300
    })
    .endQuery()      // Returns boolean value equal to true


/*
 * Let's assume we want to check whether
 * all elements of array are bigger than 20
 */

let selection3 = (sourceArray as NSArray)
    .beginQuery()
    .all({
        ($0 as! Int) > 20
    })
    .endQuery()    // Returns true


/*
 * Another case showing
 * how you can process data in the array.
 */

let selection4 = (sourceArray as NSArray)
    .beginQuery()
    .filter({
        // Selects all elements that are bigger than 200
        ($0 as! Int) > 200
    })
    .obtain({
        // Multiply each number in array by 2 times
        ($0 as! Int) * 2
    })
    .sort({
        // Sort in descending order
        ($0 as! Int) > ($1 as! Int)
    })
    .endQuery()    // Returns [16780, 16000, 8192, 4096, 2048, 512]


/*
 * You can also select first or last value from the array.
 */

let selection5 = (sourceArray as NSArray)
    .beginQuery()
    .first()
    .endQuery()

let selection6 = (sourceArray as NSArray)
    .beginQuery()
    .last()
    .endQuery()


/*
 * Also it's possible to cast result array to required type.
 */

let selection7 = (sourceArray as NSArray)
    .beginQuery()
    .cast(NSNumber.self)
    .endQuery()
```

## License

`Solid` is available under the MIT license. See the `LICENSE` file for more info.
