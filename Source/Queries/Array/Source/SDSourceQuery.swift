//
//  SDSourceQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDSourceQuery: SDArrayQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(sourceArray: [AnyObject]) {
        super.init()
        
        
        // Initialize source array
        
        _sourceArray = sourceArray
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _sourceArray: [AnyObject]!
    
    public var sourceArray: [AnyObject] {
        get {
            return _sourceArray
        }
    }
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return String(format: "Source array: %@", arguments: [sourceArray])
    }
    
    public override func performWithArray(array: [AnyObject]) -> [AnyObject] {
        return array
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
