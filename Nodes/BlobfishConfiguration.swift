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