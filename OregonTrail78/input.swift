//
//  input.swift
//  OregonTrail78
//
//  Created by kaon on 6/13/17.
//  Copyright © 2017 Peter Mikelsons. All rights reserved.
//

import Foundation

/// Read a line of text from the standard input and try to parse as an Int. Returns 0 on failure.
func readInt() -> Int {
    let line = readLine()
    if line != nil {
        return Int(line!) ?? 0
    }
    return 0
}

/// Read a line of text from the standard input and try to parse as a Double. Returns 0.0 on failure.
func readDouble() -> Double {
    let line = readLine()
    if line != nil {
        return Double(line!) ?? 0.0
    }
    return 0.0
}
