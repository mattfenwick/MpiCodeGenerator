//
//  MpiClasses.swift
//  MpiCodeGenerator
//
//  Created by Matt Fenwick on 8/6/16.
//  Copyright © 2016 mf. All rights reserved.
//

import Foundation

let profileEmployment = MpiStruct(name: "ProfileEmployment", attributes: [
        "StartDate"         : MpiAttributeType(type: .MpiString, isOptional: false),
        "IndustryId"        : MpiAttributeType(type: .MpiInt, isOptional: false),
        "EndDate"           : MpiAttributeType(type: .MpiString, isOptional: true),
        "ManagerialPosition": MpiAttributeType(type: .MpiBool, isOptional: false),
        "JobTitle"          : MpiAttributeType(type: .MpiString, isOptional: false),
        "WorkHistoryDays"   : MpiAttributeType(type: .MpiInt, isOptional: false),
        "LengthDescription" : MpiAttributeType(type: .MpiString, isOptional: false),
        "CurrentlyEmployed" : MpiAttributeType(type: .MpiBool, isOptional: false),
        "WorkplaceId"       : MpiAttributeType(type: .MpiString, isOptional: true),
        "WorkplaceAddress"  : MpiAttributeType(type: .MpiString, isOptional: true),
        "Id"                : MpiAttributeType(type: .MpiString, isOptional: false),
        "EmployerName"      : MpiAttributeType(type: .MpiString, isOptional: false)
    ])
