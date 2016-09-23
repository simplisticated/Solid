//
//  NSArrayExtensionQueries.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension NSArray {
    
    public func beginQuery() -> SDSourceQuery {
        let sourceArray = self as [AnyObject]
        let query = SDSourceQuery(sourceArray: sourceArray)
        return query
    }
    
}

