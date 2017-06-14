//
//  utilities.swift
//  OregonTrail78
//
//  Created by kaon on 6/13/17.
//  Copyright © 2017 Peter Mikelsons. All rights reserved.
//

import Foundation
import GameplayKit

/// Round off the decimels of a Double, rounding towards zero for negative values.
///
/// - Parameter value: value to round
/// - Returns: value with fractional part subtracted off (or added for negative value)
func int(_ value: Double) -> Double {
    if value < 0.0 {
        // round towards zero
        return floor(value) + 1
    }
    return floor(value)
}

/// The random number generator for the module
let rand: GKRandomSource = GKARC4RandomSource()

/// Return a Double within the uniform range [0.0...1.0].
func nextRandomFraction() -> Double {
    return Double(rand.nextUniform())
}
