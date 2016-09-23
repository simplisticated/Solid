//
//  SDContainsQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDContainsQuery: SDBooleanQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(predicate: @escaping SDContainsQueryPredicate) {
        super.init()
        
        
        // Initialize predicate
        
        _predicate = predicate
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _predicate: SDContainsQueryPredicate!
    
    public var predicate: SDContainsQueryPredicate {
        get {
            return _predicate
        }
    }
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return String(format: "Check that at least one element satisfies predicate's condition", arguments: [])
    }
    
    public override func perform(withArray array: [AnyObject]) -> Bool {
        var result = false
        
        for element in array {
            let resultForElement = predicate(element)
            
            if resultForElement {
                result = true
                break
            }
        }
        
        return result
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
