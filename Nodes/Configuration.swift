//
//  Configuration.swift
//
//  Created by Kasper Welner on 16/06/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import Foundation

public protocol ServerEnvironmentProtocol {
    static func fromBuildSettings() -> Configuration.ServerEnvironment
}

public extension ServerEnvironmentProtocol {
    static func fromBuildSettings() -> Configuration.ServerEnvironment { fatalError("NOT IMPLEMENTED") }
}

public protocol BuildTypeProtocol {
    static func fromBuildSettings() -> Configuration.BuildType
}

public extension BuildTypeProtocol {
    static func fromBuildSettings() -> Configuration.BuildType { fatalError("NOT IMPLEMENTED") }
}

public struct Configuration {
    public enum ServerEnvironment : ServerEnvironmentProtocol {
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
    
    public enum BuildType : BuildTypeProtocol {
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
    
    public static let current = Configuration(environment: ServerEnvironment.fromBuildSettings(), buildType: BuildType.fromBuildSettings())
}