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
    
    public func perform(withArray array: [AnyObject]) -> [AnyObject] {
        assertionFailure("This method should be overriden in subclass")
        return []
    }
    
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
    
    public func obtain(predicate: @escaping SDObtainQueryPredicate) -> SDObtainQuery {
        let obtainQuery = SDObtainQuery(predicate: predicate)
        obtainQuery.previousQuery = self
        return obtainQuery
    }
    
    public func filter(predicate: @escaping SDFilterQueryPredicate) -> SDFilterQuery {
        let filterQuery = SDFilterQuery(predicate: predicate)
        filterQuery.previousQuery = self
        return filterQuery
    }
    
    public func sort(predicate: @escaping SDSortQueryPredicate) -> SDSortQuery {
        let sortQuery = SDSortQuery(predicate: predicate)
        sortQuery.previousQuery = self
        return sortQuery
    }
    
    public func first() -> SDFirstQuery {
        let firstQuery = SDFirstQuery()
        firstQuery.previousQuery = self
        return firstQuery
    }
    
    public func last() -> SDLastQuery {
        let lastQuery = SDLastQuery()
        lastQuery.previousQuery = self
        return lastQuery
    }
    
    public func contains(predicate: @escaping SDContainsQueryPredicate) -> SDContainsQuery {
        let containsQuery = SDContainsQuery(predicate: predicate)
        containsQuery.previousQuery = self
        return containsQuery
    }
    
    public func all(predicate: @escaping SDAllQueryPredicate) -> SDAllQuery {
        let allQuery = SDAllQuery(predicate: predicate)
        allQuery.previousQuery = self
        return allQuery
    }
    
    public func cast<T: AnyObject>(type typeAfterCast: T.Type) -> SDArrayCastQuery<T> {
        let castQuery = SDArrayCastQuery<T>()
        castQuery.previousQuery = self
        return castQuery
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
        
        let allQueries = queryChain()
        
        guard allQueries.count != 0 else {
            return sourceArray
        }
        
        
        // Obtain result array
        
        var resultArray = sourceArray
        
        for query in allQueries {
            if query is SDArrayQuery {
                let arrayQuery = query as! SDArrayQuery
                resultArray = arrayQuery.perform(withArray: resultArray)
            }
        }
        
        
        // Return result
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
