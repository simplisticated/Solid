//
//  SDSortQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 26.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDSortQuery: SDArrayQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(predicate: SDSortQueryPredicate) {
        super.init()
        
        
        // Initialize predicate
        
        _predicate = predicate
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _predicate: SDSortQueryPredicate!
    
    public var predicate: SDSortQueryPredicate {
        get {
            return _predicate
        }
    }
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return "Sort array"
    }
    
    public override func performWithArray(array: [AnyObject]) -> [AnyObject] {
        let resultArray = array.sort { (left, right) -> Bool in
            return predicate(left: left, right: right)
        }
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
