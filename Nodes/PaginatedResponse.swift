//
//  Pagination.swift
//  Nodes
//
//  Created by Kasper Welner on 25/05/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation
import Serializable

public struct Pagination {
    public var total = 0
    public var count = 0
    public var perPage = 0
    public var currentPage = 0
    public var totalPages = 0
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
    public var pagination = Pagination()
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