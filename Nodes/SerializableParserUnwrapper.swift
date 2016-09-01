//
//  SerializableParserUnwrapper.swift
//  Nodes
//
//  Created by Kasper Welner on 25/05/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation
import Serializable

public func unwrapper() -> Parser.Unwrapper  {
    return { (sourceDictionary, type) in
        if let nestedObject = sourceDictionary.value(forKey: "data") {
            return nestedObject
        }
        
        if let nestedObject = sourceDictionary.value(forKey: String(describing: type.self)) {
            return nestedObject
        }
        
        return sourceDictionary
    }
}
