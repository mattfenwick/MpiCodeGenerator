//
//  main.swift
//  MpiCodeGenerator
//
//  Created by Matt Fenwick on 8/6/16.
//  Copyright © 2016 mf. All rights reserved.
//

import Foundation

let classes = [
    applicationStatus,
    authentication,
    employment,
    job,
    mpiListResponse,
    mpiResponse,
    mpiPagedListResponse,
    profilePhoto,
    profile,
    profileAvailability,
    profileAvailabilityTimeFrame,
    profileBasicInfo,
    profileDriver,
    profileEducation,
    profileEmployment,
    profileManager,
    profileModule,
    profileReference,
    jobsQueryPrediction
]

func writeFile(path: String, text: String) throws {
    let path = NSURL(fileURLWithPath: "/Users/matt.fenwick/gitprojects/MpiCodeGenerator/generated").URLByAppendingPathComponent(path + ".swift")
    try text.writeToURL(path, atomically: false, encoding: NSUTF8StringEncoding)
}

for classData in classes {
    let myClass = CodeGenerator.generateCodeForMpiStruct(classData)
    print("\n" + myClass + "\n")
    try writeFile(classData.name, text: myClass)
}
