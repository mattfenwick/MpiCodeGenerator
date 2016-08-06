//
//  CodeGenerator.swift
//  MpiCodeGenerator
//
//  Created by Matt Fenwick on 8/6/16.
//  Copyright © 2016 mf. All rights reserved.
//

import Foundation

extension String {
    func lowercaseFirstCharacter() -> String {
        let firstLetter = self[Range(self.startIndex ..< self.startIndex.advancedBy(1))]
        return firstLetter.lowercaseString + self[Range(self.startIndex.advancedBy(1) ..< self.endIndex)]
    }
}

class CodeGenerator {

    static func generateCodeForMpiStruct(mpiStruct: MpiStruct) -> String {
        var lines = [String]()
        // get the attributes
        let attributes: [(String, MpiAttributeType)] = mpiStruct.attributes.sort { (left, right) -> Bool in
            let lname = left.0
            let rname = right.0
            return lname < rname
        }
        // generate the class opening
        lines.append("public struct \(mpiStruct.name) {")
        // generate the attributes
        for (name, type) in attributes {
            lines.append("    public let \(name.lowercaseString): \(type.swiftType())")
        }
        lines.append("")
        // generate the initializer signature
        lines.append("    public init(")
        for (name, type) in attributes {
            lines.append("               \(name.lowercaseString): \(type.swiftType()),") // TODO get rid of , for last line
        }
        lines.append(") {")
        //   generate the initializer assignment
        for (name, _) in attributes {
            lines.append("        self.\(name.lowercaseString) = \(name.lowercaseString)")
        }
        lines.append("    }")
        lines.append("}")
        lines.append("")
        // equatable
        lines.append("extension \(mpiStruct.name): Equatable {}")
        lines.append("")
        lines.append("public func ==(left: \(mpiStruct.name), right: \(mpiStruct.name)) -> Bool {")
        lines.append("    return")
        for (name, _) in attributes {
            lines.append("        left.\(name.lowercaseString) == right.\(name.lowercaseString) &&") // TODO get rid of && for last line
        }
        lines.append("}")
        lines.append("")
        // generate jsonabletype
        lines.append("extension \(mpiStruct.name): JSONAbleType {")
        lines.append("    public static func fromJSON(rawjson: [String: AnyObject]) throws -> \(mpiStruct.name) {")
        lines.append("        let json = JSON(rawjson)")
        lines.append("        guard let")
        for (name, attr) in attributes {
            if !attr.isOptional {
                lines.append("            let \(name.lowercaseString) = json[\"\(name)\"].\(attr.type.swiftyJSONType()),")
                // TODO get rid of , for last line
            }
        }
        lines.append("                else { throw JSONAbleError.CouldNotParseJSON }")
        for (name, attr) in attributes {
            if attr.isOptional {
                lines.append("        let \(name.lowercaseString) = json[\"\(name)\"].\(attr.type.swiftyJSONType())")
            }
        }
        lines.append("        return \(mpiStruct.name)(")
        for (name, _) in attributes {
            lines.append("            \(name.lowercaseString): \(name),") // TODO get rid of , for last line
        }
        lines.append("            )")
        lines.append("    }")
        lines.append("}")
        return lines.joinWithSeparator("\n")
    }
}
