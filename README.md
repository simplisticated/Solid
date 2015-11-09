<p align="center" >
<img src="https://github.com/igormatyushkin014/Solid/blob/master/Logo/logo-1024-300.png" alt="Solid" title="Solid">
</p>

# Solid

The main purpose of this library is to make selections from arrays in Swift more clear and efficient.

##How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Solid` cocoapod

## Requirements

* iOS 8 and later
* Xcode 7 and later

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
 * all elements of array are bigger than 0
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
    .endQuery()    // Returns [512, 2048, 4096, 8192, 16000, 16780]
```

## License

`Solid` is available under the MIT license. See the `LICENSE` file for more info.
