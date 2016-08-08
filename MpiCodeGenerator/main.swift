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
    employment,
    job,
    photo,
    profileAvailability,
    profileAvailabilityTimeFrame,
    profileBasicInfo,
    profileDriver,
    profileEducation,
    profileEmployment,
    profileManager,
    profileModule,
    profileReference
]

for myClass in classes.map(CodeGenerator.generateCodeForMpiStruct) {
    print("\n" + myClass + "\n")
}
