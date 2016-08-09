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

let profileEducation = MpiStruct(name: "ProfileEducation", attributes: [
        "StartDate"         : MpiAttributeType(type: .MpiString, isOptional: true),
        "EndDate"           : MpiAttributeType(type: .MpiString, isOptional: true),
        "SchoolTypeId"      : MpiAttributeType(type: .MpiInt, isOptional: false),
        "Graduated"         : MpiAttributeType(type: .MpiBool, isOptional: false),
        "CurrentlyEnrolled" : MpiAttributeType(type: .MpiBool, isOptional: false),
        "Id"                : MpiAttributeType(type: .MpiString, isOptional: false)
    ])

let profileDriver = MpiStruct(name: "ProfileDriver", attributes: [
        "OwnVehicleForDeliveries"       : MpiAttributeType(type: .MpiBool, isOptional: false),
        "ProofOfInsuranceRegistration"  : MpiAttributeType(type: .MpiBool, isOptional: false),
        "TwoYearsExperience"            : MpiAttributeType(type: .MpiBool, isOptional: false),
        "ValidDriversLicense"           : MpiAttributeType(type: .MpiBool, isOptional: false)
    ])

let profileBasicInfo = MpiStruct(name: "ProfileBasicInfo", attributes: [
        "FirstName"             : MpiAttributeType(type: .MpiString, isOptional: false),
        "LastName"              : MpiAttributeType(type: .MpiString, isOptional: false),
        "Phone"                 : MpiAttributeType(type: .MpiString, isOptional: false),
        "Address1"              : MpiAttributeType(type: .MpiString, isOptional: false),
        "Address2"              : MpiAttributeType(type: .MpiString, isOptional: false),
        "BirthDate"             : MpiAttributeType(type: .MpiString, isOptional: false),
        "City"                  : MpiAttributeType(type: .MpiString, isOptional: false),
        "StateProvCode"         : MpiAttributeType(type: .MpiString, isOptional: false),
        "PostalCode"            : MpiAttributeType(type: .MpiString, isOptional: false),
        "AuthorizedToWorkInUs"  : MpiAttributeType(type: .MpiBool, isOptional: false),
    ])

let profileAvailability = MpiStruct(name: "ProfileAvailability", attributes: [
        "AverageHoursWillingToWorkPerWeek"  : MpiAttributeType(type: .MpiInt, isOptional: false),
        "HasReliableTransportation"         : MpiAttributeType(type: .MpiBool, isOptional: false),
        "JobSeekerId"                       : MpiAttributeType(type: .MpiString, isOptional: false)
    ])

let profileAvailabilityTimeFrame = MpiStruct(name: "ProfileAvailabilityTimeFrame", attributes: [
        "DayOfWeek": MpiAttributeType(type: .MpiInt, isOptional: false),
        "TimeFrame": MpiAttributeType(type: .MpiInt, isOptional: false)
    ])

let applicationStatus = MpiStruct(name: "ApplicationStatus", attributes: [
        "ApplicationId"     : MpiAttributeType(type: .MpiString, isOptional: false),
        "ApplicationUrl"    : MpiAttributeType(type: .MpiString, isOptional: false),
        "BrandTemplateName" : MpiAttributeType(type: .MpiString, isOptional: false),
//        "CandidateId"       : MpiAttributeType(type: .MpiString, isOptional: false), // TODO or not?
        "CandidateStatus"   : MpiAttributeType(type: .MpiInt, isOptional: true),
        "CreateDate"        : MpiAttributeType(type: .MpiString, isOptional: false),
        "CustomJobTitle"    : MpiAttributeType(type: .MpiString, isOptional: false),
        "InflightStatus"    : MpiAttributeType(type: .MpiInt, isOptional: false),
        "JobSeekerId"       : MpiAttributeType(type: .MpiString, isOptional: false),
        "PostingId"         : MpiAttributeType(type: .MpiInt, isOptional: false),
        "Status"            : MpiAttributeType(type: .MpiInt, isOptional: false),
        "ProfileShareId"    : MpiAttributeType(type: .MpiString, isOptional: true)
    ])

let job = MpiStruct(name: "Job", attributes: [
        "AddressLine1"      : MpiAttributeType(type: .MpiString, isOptional: false),
        "AddressLine2"      : MpiAttributeType(type: .MpiString, isOptional: true),
        "AppGoalScore"      : MpiAttributeType(type: .MpiInt, isOptional: true),
        "BrandTemplateId"   : MpiAttributeType(type: .MpiInt, isOptional: true),
        "City"              : MpiAttributeType(type: .MpiString, isOptional: false),
        "Company"           : MpiAttributeType(type: .MpiString, isOptional: false),
        "Date"              : MpiAttributeType(type: .MpiString, isOptional: false),
        "Distance"          : MpiAttributeType(type: .MpiString, isOptional: true),
        "Id"                : MpiAttributeType(type: .MpiString, isOptional: false),
        "LogoImageUrl"      : MpiAttributeType(type: .MpiString, isOptional: true),
        "IsExpired"         : MpiAttributeType(type: .MpiBool, isOptional: false),
        "IsSaved"           : MpiAttributeType(type: .MpiBool, isOptional: false),
        "IsMobileOptimized" : MpiAttributeType(type: .MpiBool, isOptional: false),
        "JobTitle"          : MpiAttributeType(type: .MpiString, isOptional: false),
        "Latitude"          : MpiAttributeType(type: .MpiString, isOptional: true),
        "Longitude"         : MpiAttributeType(type: .MpiString, isOptional: true),
        "LocationName"      : MpiAttributeType(type: .MpiString, isOptional: true),
        "PostalCode"        : MpiAttributeType(type: .MpiString, isOptional: true),
        "StateProvCode"     : MpiAttributeType(type: .MpiString, isOptional: false),
        "StateProvName"     : MpiAttributeType(type: .MpiString, isOptional: false)
    ])

let profileManager = MpiStruct(name: "ProfileManager", attributes: [
        "IsAvailableForOvernightTravel" : MpiAttributeType(type: .MpiBool, isOptional: false),
        "IsWillingToRelocate"           : MpiAttributeType(type: .MpiBool, isOptional: false),
        "CertificationDescription"      : MpiAttributeType(type: .MpiString, isOptional: false),
        "ExperienceDescription"         : MpiAttributeType(type: .MpiString, isOptional: false),
        "TotalWorkExperienceMonths"     : MpiAttributeType(type: .MpiInt, isOptional: false),
        "TotalWorkExperienceDescription": MpiAttributeType(type: .MpiString, isOptional: false)
    ])

let photo = MpiStruct(name: "Photo", attributes: [
        "Url" : MpiAttributeType(type: .MpiString, isOptional: false)
    ])

let profileReference = MpiStruct(name: "ProfileReference", attributes: [
        "AssociationId" : MpiAttributeType(type: .MpiInt, isOptional: false),
        "FirstName"     : MpiAttributeType(type: .MpiString, isOptional: false),
        "Id"            : MpiAttributeType(type: .MpiString, isOptional: false),
        "JobSeekerId"   : MpiAttributeType(type: .MpiString, isOptional: true),
        "LastName"      : MpiAttributeType(type: .MpiString, isOptional: false),
        "Phone"         : MpiAttributeType(type: .MpiString, isOptional: false),
    ])

let profileModule = MpiStruct(name: "ProfileModule", attributes: [
        "NeedsReview"   : MpiAttributeType(type: .MpiBool, isOptional: false),
        "Name"          : MpiAttributeType(type: .MpiString, isOptional: false),
        "Id"            : MpiAttributeType(type: .MpiInt, isOptional: false),
        "IsVisible"     : MpiAttributeType(type: .MpiBool, isOptional: false)
    ])

let employment = MpiStruct(name: "Employment", attributes: [
        "City"              : MpiAttributeType(type: .MpiString, isOptional: false),
        "ContactEmployer"   : MpiAttributeType(type: .MpiBool, isOptional: false),
        "CurrentlyEmployed" : MpiAttributeType(type: .MpiBool, isOptional: false),
        "EmployerName"      : MpiAttributeType(type: .MpiString, isOptional: false),
        "EmploymentId"      : MpiAttributeType(type: .MpiString, isOptional: false),
        "EmploymentType"    : MpiAttributeType(type: .MpiString, isOptional: true),
        "EndDate"           : MpiAttributeType(type: .MpiString, isOptional: false),
        "JobTitle"          : MpiAttributeType(type: .MpiString, isOptional: false),
        "LengthDescription" : MpiAttributeType(type: .MpiString, isOptional: true),
        "ManagerialPosition": MpiAttributeType(type: .MpiBool, isOptional: false),
        "Phone"             : MpiAttributeType(type: .MpiString, isOptional: false),
        "ReasonForLeaving"  : MpiAttributeType(type: .MpiString, isOptional: false),
        "StartDate"         : MpiAttributeType(type: .MpiString, isOptional: false),
        "StateProvCode"     : MpiAttributeType(type: .MpiString, isOptional: false),
        "SupervisorName"    : MpiAttributeType(type: .MpiString, isOptional: false),
        "WorkHistoryDays"   : MpiAttributeType(type: .MpiString, isOptional: false),
        "WorkplaceId"       : MpiAttributeType(type: .MpiString, isOptional: true),
        "WorkplaceAddress"  : MpiAttributeType(type: .MpiString, isOptional: true)
    ])

let mpiListResponse = MpiStruct(name: "MPIListResponse", attributes: [
    :
    ])

let mpiResponse = MpiStruct(name: "MPIResponse", attributes: [
        "Total"         : MpiAttributeType(type: .MpiInt, isOptional: false),
        "StartNum"      : MpiAttributeType(type: .MpiInt, isOptional: false),
        "EndNum"        : MpiAttributeType(type: .MpiInt, isOptional: false),
//        "Element": MpiAttributeType(type: .MpiTypeVariable("T"), isOptional: false)
    ])

let mpiPagedListResponse = MpiStruct(name: "MPIPagedListResponse", attributes: [
        "Total"         : MpiAttributeType(type: .MpiInt, isOptional: false),
        "StartNum"      : MpiAttributeType(type: .MpiInt, isOptional: false),
        "EndNum"        : MpiAttributeType(type: .MpiInt, isOptional: false),
        "NumRequested"  : MpiAttributeType(type: .MpiInt, isOptional: false)
    ])
