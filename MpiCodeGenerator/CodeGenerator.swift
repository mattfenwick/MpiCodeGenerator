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
        var buffer = [String]()
        let attributes: [(String, MpiAttributeType)] = mpiStruct.attributes.sort { (left, right) -> Bool in
            let lname = left.0
            let rname = right.0
            return lname < rname
        }
        buffer.append(generateStruct(mpiStruct.name, attributes: attributes))
        buffer.append(generateEquatableInstance(mpiStruct.name, attributes: attributes))
        buffer.append(generateJSONAbleType(mpiStruct.name, attributes: attributes))
        return buffer.joinWithSeparator("\n")
    }

    private static func generateStruct(structName: String, attributes: [(String, MpiAttributeType)]) -> String {
        var buffer = [String]()
        buffer.append("public struct \(structName) {")
        // generate the attributes
        for (name, type) in attributes {
            buffer.append("    public let \(name.lowercaseString): \(type.swiftType())")
        }
        buffer.append("")
        // generate the initializer signature
        buffer.append("    public init(")
        buffer.append(attributes.map { attr -> String in
                let (name, type) = attr
                return "               \(name.lowercaseString): \(type.swiftType())"
            }.joinWithSeparator(",\n") + ") {")
        //   generate the initializer assignment
        for (name, _) in attributes {
            buffer.append("        self.\(name.lowercaseString) = \(name.lowercaseString)")
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
                return "        left.\(name.lowercaseString) == right.\(name.lowercaseString)"
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
        buffer.append("        guard let")
        for (name, attr) in attributes {
            if !attr.isOptional {
                buffer.append("            \(name.lowercaseString) = json[\"\(name)\"].\(attr.type.swiftyJSONType()),")
                // TODO get rid of , for last line
            }
        }
        buffer.append("                else { throw JSONAbleError.CouldNotParseJSON }")
        for (name, attr) in attributes {
            if attr.isOptional {
                buffer.append("        let \(name.lowercaseString) = json[\"\(name)\"].\(attr.type.swiftyJSONType())")
            }
        }
        buffer.append("        return \(structName)(")
        for (name, _) in attributes {
            buffer.append("            \(name.lowercaseString): \(name),") // TODO get rid of , for last line
        }
        buffer.append("            )")
        buffer.append("    }")
        buffer.append("}")
        return buffer.joinWithSeparator("\n")
    }
}
