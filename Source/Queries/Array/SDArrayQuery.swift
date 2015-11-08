//
//  SDArrayQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDArrayQuery: SDQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    public func skip(count: Int) -> SDSkipQuery {
        let skipQuery = SDSkipQuery(count: count)
        skipQuery.previousQuery = self
        return skipQuery
    }
    
    public func take(count: Int) -> SDTakeQuery {
        let takeQuery = SDTakeQuery(count: count)
        takeQuery.previousQuery = self
        return takeQuery
    }
    
    public func contains(predicate: SDContainsQueryPredicate) -> SDContainsQuery {
        let containsQuery = SDContainsQuery(predicate: predicate)
        containsQuery.previousQuery = self
        return containsQuery
    }
    
    public func all(predicate: SDAllQueryPredicate) -> SDAllQuery {
        let allQuery = SDAllQuery(predicate: predicate)
        allQuery.previousQuery = self
        return allQuery
    }
    
    public func endQuery() -> [AnyObject] {
        // Retrieve source query
        
        let sourceQuery = findSourceQuery()
        
        guard sourceQuery != nil else {
            return []
        }
        
        
        // Retrieve source array
        
        let sourceArray = sourceQuery!.sourceArray
        
        
        // Retrieve chain of queries
        
        let chainOfQueries = queryChain()
        
        guard chainOfQueries.count != 0 else {
            return sourceArray
        }
        
        
        // Obtain result array
        
        var resultArray = sourceArray
        
        for query in chainOfQueries {
            if query is SDSkipQuery {
                let skipQuery = query as! SDSkipQuery
                
                if resultArray.count > 0 {
                    let startIndexOfSelection = skipQuery.count
                    
                    let currentMaxIndexInResultArray = resultArray.count - 1
                    
                    if startIndexOfSelection > currentMaxIndexInResultArray {
                        resultArray = []
                    }
                    else {
                        let numberOfElementsInSelection = resultArray.count - startIndexOfSelection
                        
                        let range = NSMakeRange(startIndexOfSelection, numberOfElementsInSelection)
                        resultArray = (resultArray as NSArray).subarrayWithRange(range) as [AnyObject]
                    }
                }
            }
            else if query is SDTakeQuery {
                let takeQuery = query as! SDTakeQuery
                
                if resultArray.count > 0 {
                    var countToTake = takeQuery.count
                    
                    if countToTake > resultArray.count {
                        countToTake = resultArray.count
                    }
                    
                    let range = NSMakeRange(0, countToTake)
                    resultArray = (resultArray as NSArray).subarrayWithRange(range) as [AnyObject]
                }
            }
        }
        
        
        // Return result
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
