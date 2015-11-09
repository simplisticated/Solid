//
//  SDArrayCastQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDArrayCastQuery<ResultArrayType: AnyObject>: SDCastQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public override init() {
        super.init()
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    public func endQuery() -> [ResultArrayType] {
        // Check existance of previous query
        
        guard previousQuery != nil else {
            return []
        }
        
        
        // Check that previous query is an array query
        
        guard previousQuery is SDArrayQuery else {
            return []
        }
        
        
        // Obtain result array of previous query
        
        var resultArrayFromPreviousQuery: [AnyObject]? = nil
        
        if previousQuery is SDArrayQuery {
            let arrayQuery = previousQuery as! SDArrayQuery
            resultArrayFromPreviousQuery = arrayQuery.endQuery()
        }
        else {
            resultArrayFromPreviousQuery = []
        }
        
        
        // Obtain result
        
        let resultArray = resultArrayFromPreviousQuery as! [ResultArrayType]
        
        
        // Return result
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
