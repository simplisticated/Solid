//
//  SDTakeQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDTakeQuery: SDArrayQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(count: Int) {
        super.init()
        
        
        // Assertion for count
        
        assert(count >= 0, "Count should not be less than 0")
        
        
        // Initialize count
        
        _count = count
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _count: Int!
    
    public var count: Int {
        get {
            return _count
        }
    }
    
    
    // MARK: Public methods
    
    override func performWithArray(array: [AnyObject]) -> [AnyObject] {
        // Check whether take count is bigger than 0
        
        guard count > 0 else {
            return []
        }
        
        
        // Check whether number of elements in array is bigger than 0
        
        guard array.count > 0 else {
            return []
        }
        
        
        // Obtain number of elements to take
        
        var countToTake = count
        
        if countToTake > array.count {
            countToTake = array.count
        }
        
        
        // Obtain result array
        
        let range = NSMakeRange(0, countToTake)
        let resultArray = (array as NSArray).subarrayWithRange(range) as [AnyObject]
        
        
        // Return result
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
