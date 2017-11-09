//
//  Pagination.swift
//  Nodes
//
//  Created by Kasper Welner on 25/05/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation
import Serpent

public struct Paginator {
    public var total = 0
    public var count = 0
    public var perPage = 0
    public var currentPage = 0
    public var totalPages = 0
}

extension Paginator: Serializable {
    public init(dictionary: NSDictionary?) {
        total       <== (self, dictionary, "total")
        count       <== (self, dictionary, "count")
        perPage     <== (self, dictionary, "perPage")
        currentPage <== (self, dictionary, "currentPage")
        totalPages  <== (self, dictionary, "totalPages")
    }
    
    public func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "total")       <== total
        (dict, "count")       <== count
        (dict, "perPage")     <== perPage
        (dict, "currentPage") <== currentPage
        (dict, "totalPages")  <== totalPages
        return dict
    }
}

public struct Meta {
    public var paginator = Paginator()
}

extension Meta: Serializable {
    public init(dictionary: NSDictionary?) {
        paginator <== (self, dictionary, "paginator")
    }
    
    public func encodableRepresentation() -> NSCoding {
        let dict = NSMutableDictionary()
        (dict, "paginator") <== paginator
        return dict
    }
}

protocol PaginatedResponseProtocol { }

public final class PaginatedResponse<T:Serializable> {
    public var data:[T] = [T]()
    public var meta:Meta = Meta()
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
