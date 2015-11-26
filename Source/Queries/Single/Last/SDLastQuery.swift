//
//  SDLastQuery.swift
//  SolidDemo
//
//  Created by Igor Matyushkin on 26.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDLastQuery: SDSingleSelectionQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    override init() {
        super.init()
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return String(format: "Select last element", arguments: [])
    }
    
    public override func performWithArray(array: [AnyObject]) -> AnyObject? {
        let resultObject = array.last
        return resultObject
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
