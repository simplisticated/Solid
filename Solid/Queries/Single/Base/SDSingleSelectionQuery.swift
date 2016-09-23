//
//  SDSingleSelectionQuery.swift
//  SolidDemo
//
//  Created by Igor Matyushkin on 26.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDSingleSelectionQuery: SDQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    public func performWithArray(array: [AnyObject]) -> AnyObject? {
        assertionFailure("This method should be overriden in subclass")
        return nil
    }
    
    public func endQuery() -> AnyObject? {
        // Check existance of previous query
        
        guard previousQuery != nil else {
            return nil
        }
        
        
        // Check that previous query is not a boolean query
        
        guard !(previousQuery is SDSingleSelectionQuery) else {
            return nil
        }
        
        
        // Obtain result array of previous query
        
        var resultArray: [AnyObject]? = nil
        
        if previousQuery is SDArrayQuery {
            let arrayQuery = previousQuery as! SDArrayQuery
            resultArray = arrayQuery.endQuery()
        }
        else {
            resultArray = []
        }
        
        
        // Obtain result
        
        let result = performWithArray(array: resultArray!)
        
        
        // Return result
        
        return result
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
