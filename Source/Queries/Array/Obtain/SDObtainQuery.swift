//
//  SDObtainQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 10.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDObtainQuery: SDArrayQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(predicate: SDObtainQueryPredicate) {
        super.init()
        
        
        // Initialize predicate
        
        _predicate = predicate
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _predicate: SDObtainQueryPredicate!
    
    public var predicate: SDObtainQueryPredicate {
        get {
            return _predicate
        }
    }
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return String(format: "Select elements by predicate", arguments: [])
    }
    
    public override func performWithArray(array: [AnyObject]) -> [AnyObject] {
        var resultArray: [AnyObject] = []
        
        for element in array {
            let resultElement = predicate(element: element)
            resultArray.append(resultElement)
        }
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
