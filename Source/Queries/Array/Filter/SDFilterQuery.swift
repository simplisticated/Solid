//
//  SDFilterQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 10.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDFilterQuery: SDArrayQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(predicate: SDFilterQueryPredicate) {
        super.init()
        
        
        // Initialize predicate
        
        _predicate = predicate
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _predicate: SDFilterQueryPredicate!
    
    public var predicate: SDFilterQueryPredicate {
        get {
            return _predicate
        }
    }
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return String(format: "Filter elements by predicate", arguments: [])
    }
    
    override func performWithArray(array: [AnyObject]) -> [AnyObject] {
        var resultArray: [AnyObject] = []
        
        for element in array {
            let elementSatisfiesConditions = predicate(element: element)
            
            if elementSatisfiesConditions {
                resultArray.append(element)
            }
        }
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
