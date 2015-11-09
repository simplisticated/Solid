//
//  SDBooleanQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDBooleanQuery: SDQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    public func endQuery() -> Bool {
        // Check existance of previous query
        
        guard previousQuery != nil else {
            return false
        }
        
        
        // Check that previous query is not a boolean query
        
        guard !(previousQuery is SDBooleanQuery) else {
            return false
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
        
        var result: Bool? = nil
        
        if self is SDContainsQuery {
            let containsQuery = self as! SDContainsQuery
            
            result = false
            
            for element in resultArray! {
                let resultForElement = containsQuery.predicate(element: element)
                
                if resultForElement {
                    result = true
                    break
                }
            }
        }
        else if self is SDAllQuery {
            let allQuery = self as! SDAllQuery
            
            result = true
            
            for element in resultArray! {
                let resultForElement = allQuery.predicate(element: element)
                
                if !resultForElement {
                    result = false
                    break
                }
            }
        }
        else {
            result = false
        }
        
        
        // Return result
        
        return result!
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
