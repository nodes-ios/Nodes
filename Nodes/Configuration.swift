//
//  Configuration.swift
//
//  Created by Kasper Welner on 16/06/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation

public protocol BuildSettingsInitializable {
    static func fromBuildSettings() -> Self
}

public struct Configuration {
    public enum ServerEnvironment {
        case development(baseURLString:String)
        case staging(baseURLString:String)
        case live(baseURLString:String)
        
        public var stringValue:String {
            switch self {
                case .development:  return "development"
                case .staging:      return "staging"
                case .live:         return "live"
            }
        }
    }
    
    public enum BuildType {
        case debug
        case test
        case release
        
        public var stringValue:String {
            switch self {
                case .debug:    return "Debug"
                case .test:     return "Test"
                case .release:  return "Release"
            }
        }
    }

    public let environment:ServerEnvironment
    public let buildType:BuildType
}