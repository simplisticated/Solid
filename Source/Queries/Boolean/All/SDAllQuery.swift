//
//  SDAllQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDAllQuery: SDBooleanQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(predicate: SDAllQueryPredicate) {
        super.init()
        
        
        // Initialize predicate
        
        _predicate = predicate
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _predicate: SDAllQueryPredicate!
    
    public var predicate: SDAllQueryPredicate {
        get {
            return _predicate
        }
    }
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return String(format: "Check that all elements satisfy predicate's condition", arguments: [])
    }
    
    public override func performWithArray(array: [AnyObject]) -> Bool {
        var result = true
        
        for element in array {
            let resultForElement = predicate(element: element)
            
            if !resultForElement {
                result = false
                break
            }
        }
        
        return result
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
