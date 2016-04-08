//
//  Nodes.swift
//  Nodes
//
//  Created by Kasper Welner on 18/03/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation
import Blobfish
import Serializable

public struct BlobfishConfiguration {
    static func errorCodeMapping() -> [Int : Blobfish.AlamofireConfig.ErrorCategory] {
        return [
            441 : .Token,
            442 : .Token,
            443 : .Token,
        ]
    }
}

public func unwrapper() -> Parser.Unwrapper  {
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

public struct Pagination {
    var total = 0
    var count = 0
    var perPage = 0
    var currentPage = 0
    var totalPages = 0
}

extension Pagination: Serializable {
    public init(dictionary: NSDictionary?) {
        total       <== (self, dictionary, "total")
        count       <== (self, dictionary, "count")
        perPage     <== (self, dictionary, "per_page")
        currentPage <== (self, dictionary, "current_page")
        totalPages  <== (self, dictionary, "total_pages")
    }
    
    public func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "total")        <== total
        (dict, "count")        <== count
        (dict, "per_page")     <== perPage
        (dict, "current_page") <== currentPage
        (dict, "total_pages")  <== totalPages
        return dict
    }
}

public struct Meta {
    var pagination = Pagination()
}

extension Meta: Serializable {
    public init(dictionary: NSDictionary?) {
        pagination <== (self, dictionary, "pagination")
    }
    
    public func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "pagination") <== pagination
        return dict
    }
}

protocol PaginatedResponseProtocol { }

public final class PaginatedResponse<T:Serializable> {
    var data:[T] = [T]()
    var meta:Meta = Meta()
}

extension PaginatedResponse: PaginatedResponseProtocol {}

extension PaginatedResponse: Serializable {
    convenience public init(dictionary: NSDictionary?) {
        self.init()
        data <== (self, dictionary, "data")
        meta <== (self, dictionary, "meta")
    }
    
    public func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "data") <== data
        (dict, "meta") <== meta
        return dict
    }
}