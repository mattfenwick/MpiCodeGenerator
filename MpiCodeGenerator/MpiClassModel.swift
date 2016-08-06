//
//  MpiClassModel.swift
//  MpiCodeGenerator
//
//  Created by Matt Fenwick on 8/6/16.
//  Copyright © 2016 mf. All rights reserved.
//

import Foundation

enum MpiAttributeBaseType: String {
    case MpiString = "String"
    case MpiInt = "Int"
    case MpiBool = "Bool"
}

struct MpiAttributeType {
    let type: MpiAttributeBaseType
    let isOptional: Bool
}

struct MpiStruct {
    let name: String
    let attributes: Dictionary<String, MpiAttributeType>
}
