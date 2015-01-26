//
//  main.swift
//  plistutil
//
//  Created by Sean on 1/23/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import Darwin

let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
let srcPath = userDefaults.stringForKey("s")
let outputPath = userDefaults.stringForKey("o")

if (srcPath == nil || outputPath == nil) {
    println("This to is used to convert a plist file to a binary format output")
    println("plistutil -s <source path> -o <output path>")
    exit(-1)
} else {
    let plistData = NSData(contentsOfFile:srcPath!)
    let error:NSErrorPointer = nil;
    let format:UnsafeMutablePointer<NSPropertyListFormat> = nil;
    let plist:AnyObject? = NSPropertyListSerialization.propertyListWithData(plistData!, options:Int(NSPropertyListMutabilityOptions.Immutable.rawValue), format:format, error: error)
    if let actualError = error.memory {
        println("Error Occurred in decoding the source file: \(actualError)")
        exit(-1)
    }
    let outData = NSPropertyListSerialization.dataWithPropertyList(plist!, format:NSPropertyListFormat.BinaryFormat_v1_0, options:Int(NSPropertyListMutabilityOptions.Immutable.rawValue), error: error)
    if let actualError = error.memory {
        println("Error Occurred in writting to output file: \(actualError)")
        exit(-1)
    }
    outData?.writeToFile(outputPath!, atomically: true)
}


