//
//  SerializableParserUnwrapper.swift
//  Nodes
//
//  Created by Kasper Welner on 25/05/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation

public func unwrapper() -> ((sourceDictionary: NSDictionary, expectedType:Any) -> AnyObject?)  {
    return { (sourceDictionary, type) in
        if let nestedObject: AnyObject = sourceDictionary["data"] {
            return nestedObject
        }
        
        if let nestedObject: AnyObject = sourceDictionary[String(type.dynamicType)] {
            return nestedObject
        }
        
        return sourceDictionary
    }
}