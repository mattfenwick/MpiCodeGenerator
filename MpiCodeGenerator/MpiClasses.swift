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
        "JobTitle"          : MpiAttributeType(type: .MpiString, isOptional: false)
    ])

/*
public struct ProfileEmployment {
    public let startDate: String
    public let industryId: Int
    public let endDate: String?
    public let managerialPosition: Bool
    public let jobTitle: String
    public let workHistoryDays: Int
    public let lengthDescription: String
    public let currentlyEmployed: Bool
    public let workplaceId: String?
    public let workplaceAddress: String?
    public let id: String
    public let employerName: String

    public init(id: String,
                workplaceId: String?,
                jobTitle: String,
                employerName: String,
                startDate: String,
                endDate: String?,
                industryId: Int,
                managerialPosition: Bool,
                workHistoryDays: Int,
                lengthDescription: String,
                currentlyEmployed: Bool,
                workplaceAddress: String?) {
        self.startDate = startDate
        self.industryId = industryId
        self.endDate = endDate
        self.managerialPosition = managerialPosition
        self.jobTitle = jobTitle
        self.workHistoryDays = workHistoryDays
        self.lengthDescription = lengthDescription
        self.currentlyEmployed = currentlyEmployed
        self.workplaceId = workplaceId
        self.workplaceAddress = workplaceAddress
        self.id = id
        self.employerName = employerName
    }
}

extension ProfileEmployment: Equatable {}

public func ==(left: ProfileEmployment, right: ProfileEmployment) -> Bool {
    return left.currentlyEmployed == right.currentlyEmployed &&
        left.employerName == right.employerName &&
        left.endDate == right.endDate &&
        left.id == right.id &&
        left.industryId == right.industryId &&
        left.jobTitle == right.jobTitle &&
        left.lengthDescription == right.lengthDescription &&
        left.managerialPosition == right.managerialPosition &&
        left.startDate == right.startDate &&
        left.workHistoryDays == right.workHistoryDays &&
        left.workplaceAddress == right.workplaceAddress &&
        left.workplaceId == right.workplaceId
}

extension ProfileEmployment: JSONAbleType {
    public static func fromJSON(rawjson: [String: AnyObject]) throws -> ProfileEmployment {
        let json = JSON(rawjson)
        guard let startDate = json["StartDate"].string,
            let industryId = json["IndustryId"].int,
            let managerialPosition = json["ManagerialPosition"].bool,
            let jobTitle = json["JobTitle"].string,
            let workHistoryDays = json["WorkHistoryDays"].int,
            let lengthDescription = json["LengthDescription"].string,
            let currentlyEmployed = json["CurrentlyEmployed"].bool,
            let id = json["Id"].string,
            let employerName = json["EmployerName"].string else {
                throw JSONAbleError.CouldNotParseJSON
        }
        let endDate = json["EndDate"].string
        let workplaceAddress = json["WorkplaceAddress"].string
        let workplaceId = json["WorkplaceId"].string
        return ProfileEmployment(id: id,
                                 workplaceId: workplaceId,
                                 jobTitle: jobTitle,
                                 employerName: employerName,
                                 startDate: startDate,
                                 endDate: endDate,
                                 industryId: industryId,
                                 managerialPosition: managerialPosition,
                                 workHistoryDays: workHistoryDays,
                                 lengthDescription: lengthDescription,
                                 currentlyEmployed: currentlyEmployed,
                                 workplaceAddress: workplaceAddress)
    }
}
*/