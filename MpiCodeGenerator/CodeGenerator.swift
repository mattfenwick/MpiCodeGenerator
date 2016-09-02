//
//  CodeGenerator.swift
//  MpiCodeGenerator
//
//  Created by Matt Fenwick on 8/6/16.
//  Copyright © 2016 mf. All rights reserved.
//

import Foundation

extension String {
    var lowercaseFirstCharacter: String {
        let firstLetter = self[Range(self.startIndex ..< self.startIndex.advancedBy(1))]
        return firstLetter.lowercaseString + self[Range(self.startIndex.advancedBy(1) ..< self.endIndex)]
    }
}

class CodeGenerator {

    static func generateCodeForMpiStruct(mpiStruct: MpiStruct) -> String {
        var buffer = [String]()
        let attributes: [(String, MpiAttributeType)] = mpiStruct.attributes.sort { (left, right) -> Bool in
            let lname = left.0
            let rname = right.0
            return lname < rname
        }
        buffer.append(generateImports())
        buffer.append(generateStruct(mpiStruct.name, attributes: attributes))
        buffer.append(generateEquatableInstance(mpiStruct.name, attributes: attributes))
        buffer.append(generateJSONAbleType(mpiStruct.name, attributes: attributes))
        return buffer.joinWithSeparator("\n")
    }

    private static func generateImports() -> String {
        let buffer = ["import Foundation", "import SnagFoundation", "import SwiftyJSON", ""]
        return buffer.joinWithSeparator("\n")
    }

    private static func generateStruct(structName: String, attributes: [(String, MpiAttributeType)]) -> String {
        var buffer = [String]()
        buffer.append("public struct \(structName) {")
        // generate the attributes
        for (name, type) in attributes {
            buffer.append("    public let \(name.lowercaseFirstCharacter): \(type.swiftType())")
        }
        buffer.append("")
        // generate the initializer signature
        buffer.append("    public init(")
        buffer.append(attributes.map { attr -> String in
                let (name, type) = attr
                return "               \(name.lowercaseFirstCharacter): \(type.swiftType())"
            }.joinWithSeparator(",\n") + ") {")
        //   generate the initializer assignment
        for (name, _) in attributes {
            buffer.append("        self.\(name.lowercaseFirstCharacter) = \(name.lowercaseFirstCharacter)")
        }
        buffer.append("    }")
        buffer.append("}")
        buffer.append("")
        return buffer.joinWithSeparator("\n")
    }

    private static func generateEquatableInstance(structName: String, attributes: [(String, MpiAttributeType)]) -> String {
        var buffer = [String]()
        buffer.append("extension \(structName): Equatable {}")
        buffer.append("")
        buffer.append("public func ==(left: \(structName), right: \(structName)) -> Bool {")
        buffer.append("    return")
        buffer.append(attributes.map { attr -> String in
                let (name, _) = attr
                return "        left.\(name.lowercaseFirstCharacter) == right.\(name.lowercaseFirstCharacter)"
            }.joinWithSeparator(" &&\n"))
        buffer.append("}")
        buffer.append("")
        return buffer.joinWithSeparator("\n")
    }

    private static func generateJSONAbleType(structName: String, attributes: [(String, MpiAttributeType)]) -> String {
        var buffer = [String]()
        buffer.append("extension \(structName): JSONAbleType {")
        buffer.append("    public static func fromJSON(rawjson: [String: AnyObject]) throws -> \(structName) {")
        buffer.append("        let json = JSON(rawjson)")

        buffer.append("        return \(structName)(")
        buffer.append(attributes.map { attr -> String in
                let (name, type) = attr
                let prefix = "            \(name.lowercaseFirstCharacter): "
                if type.isOptional {
                    return prefix + "try json.getOptionalValue(\"\(name)\")"
                } else {
                    return prefix + "try json.getValue(\"\(name)\")"
                }
            }.joinWithSeparator(",\n") + ")")

        buffer.append("    }")

        buffer.append("")
        buffer.append("    public func asJSON() -> [String : AnyObject] {")
        buffer.append("        return [")
        for (name, type) in attributes {
            if type.isOptional {
                buffer.append("            \"\(name)\": \(name.lowercaseFirstCharacter) ?? NSNull(),")
            } else {
                buffer.append("            \"\(name)\": \(name.lowercaseFirstCharacter),")
            }
        }
        buffer.append("        ]")
        buffer.append("    }")

        buffer.append("}")
        return buffer.joinWithSeparator("\n")
    }
}
