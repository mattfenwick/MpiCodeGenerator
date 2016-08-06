//
//  MpiClassModel.swift
//  MpiCodeGenerator
//
//  Created by Matt Fenwick on 8/6/16.
//  Copyright © 2016 mf. All rights reserved.
//

import Foundation

enum MpiAttributeBaseType {
    case MpiString
    case MpiInt
    case MpiBool

    func swiftType() -> String {
        switch self {
        case .MpiString: return "String"
        case .MpiInt: return "Int"
        case .MpiBool: return "Bool"
        }
    }

    func swiftyJSONType() -> String {
        return self.swiftType().lowercaseString
    }
}

struct MpiAttributeType {
    let type: MpiAttributeBaseType
    let isOptional: Bool

    func swiftType() -> String {
        return type.swiftType() + (isOptional ? "?" : "")
    }
}

struct MpiStruct {
    let name: String
    let attributes: Dictionary<String, MpiAttributeType>
}
