//
//  SDQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDQuery: NSObject {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _previousQuery: SDQuery?
    
    public var previousQuery: SDQuery? {
        get {
            return _previousQuery
        }
        set {
            // Update private variable
            
            _previousQuery = newValue
        }
    }
    
    
    // MARK: Public methods
    
    public func findSourceQuery() -> SDSourceQuery? {
        if self is SDSourceQuery {
            return self as? SDSourceQuery
        }
        else if previousQuery == nil {
            return nil
        }
        else {
            return previousQuery!.findSourceQuery()
        }
    }
    
    public func queryChain() -> [SDQuery] {
        // Create collection of queries
        
        var queryCollection: [SDQuery] = [
            self
        ]
        
        
        // Declare function that will insert previous query to the beginning of collection recursively
        
        func insertPreviousQueryToBeginningOfCollectionRecursivelyStartingFromQuery(currentQuery currentQuery: SDQuery) -> Void {
            let previousQuery = currentQuery.previousQuery
            
            if previousQuery != nil {
                queryCollection.insert(previousQuery!, atIndex: 0)
                insertPreviousQueryToBeginningOfCollectionRecursivelyStartingFromQuery(currentQuery: previousQuery!)
            }
        }
        
        
        // Start recursion
        
        insertPreviousQueryToBeginningOfCollectionRecursivelyStartingFromQuery(currentQuery: self)
        
        
        // Return result
        
        return queryCollection
    }
    
    public func queryDescription() -> String {
        assertionFailure("This method should be overriden in subclass")
        return ""
    }
    
    public func logCurrentQuery() -> SDQuery {
        let descriptionForCurrentQuery = queryDescription()
        NSLog("%@", descriptionForCurrentQuery)
        
        return self
    }
    
    public func logQueryChain() -> SDQuery {
        let allQueries = queryChain()
        
        for query in allQueries {
            query.logCurrentQuery()
        }
        
        return self
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
