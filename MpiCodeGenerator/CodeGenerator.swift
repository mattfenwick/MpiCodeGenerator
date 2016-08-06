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
        // generate the class opening
        lines.append("public struct \(mpiStruct.name) {")
        // get the attributes
        let sortedAttributes: [(String, MpiAttributeType)] = mpiStruct.attributes.sort { (left, right) -> Bool in
            let lname = left.0
            let rname = right.0
            return lname < rname
        }
        let attributes: [(String, String, MpiAttributeType)] = sortedAttributes.map { attr in
            return (attr.0, attr.0.lowercaseString, attr.1)
        }
        // generate the attributes
        for (_, lowercaseName, type) in attributes {
            let fullType = "\(type.type)\(type.isOptional ? "?" : "")"
            lines.append("    public let \(lowercaseName): \(fullType)")
        }
        lines.append("")
        // generate the initializer signature
        lines.append("public init(")
        for (_, lowercaseName, type) in attributes {
            let fullType = "\(type.type)\(type.isOptional ? "?" : "")"
            lines.append("               \(lowercaseName): \(fullType),") // TODO get rid of , for last line
        }
        lines.append(") {")
        //   generate the initializer assignment
        for (_, lowercaseName, _) in attributes {
            lines.append("        self.\(lowercaseName) = \(lowercaseName)")
        }
        lines.append("    }")
        lines.append("")
        // equatable
        lines.append("extension \(mpiStruct.name): Equatable {}")
        lines.append("")
        lines.append("public func ==(left: \(mpiStruct.name), right: \(mpiStruct.name)) -> Bool {")
        lines.append("    return")
        for (_, lowercaseName, _) in attributes {
            lines.append("        left.\(lowercaseName) == right.\(lowercaseName) &&") // TODO get rid of && for last line
        }
        lines.append("}")
        lines.append("")
        // generate jsonabletype
        lines.append("extension \(mpiStruct.name): JSONAbleType {")
        lines.append("    public static func fromJSON(rawjson: [String: AnyObject]) throws -> \(mpiStruct.name) {")
        lines.append("        let json = JSON(rawjson)")
        lines.append("        guard let")
        for (uppercaseName, lowercaseName, attr) in attributes {
            if !attr.isOptional {
                lines.append("            let \(lowercaseName) = json[\"\(uppercaseName)\"].\(attr.type),") // TODO first letter of type name must be lowercase
                // TODO get rid of , for last line
            }
        }
        lines.append("                else { throw JSONAbleError.CouldNotParseJSON }")
        for (uppercaseName, lowercaseName, attr) in attributes {
            if attr.isOptional {
                lines.append("        let \(lowercaseName) = json[\"\(uppercaseName)\"].\(attr.type)") // TODO first letter of type name should be lowercase
            }
        }
        lines.append("        return \(mpiStruct.name)(")
        for (_, lowercaseName, _) in attributes {
            lines.append("            \(lowercaseName): \(lowercaseName),") // TODO get rid of , for last line
        }
        lines.append("            )")
        lines.append("    }")
        lines.append("}")
        return lines.joinWithSeparator("\n")
    }
}
