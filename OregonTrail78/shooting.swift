//
//  shooting.swift
//  OregonTrail78
//
//  Created by kaon on 6/13/17.
//  Copyright © 2017 Peter Mikelsons. All rights reserved.
//

import Foundation

// ("shootingExpertise" was "D9")
/// Player's selected handicap at shooting (in seconds)
var shootingExpertise = 0

/// Prompt player to select how good they are at shooting.
func initShootingExpertise() {
    print("HOW GOOD A SHOT ARE YOU WITH YOUR RIFLE?")
    print(" (1) ACE MARKSMAN, (2) GOOD SHOT, (3) FAIR TO MIDDLIN'")
    print(" (4) NEED MORE PRACTICE, (5) SHAKY KNEES")
    print("ENTER ONE OF THE ABOVE -- THE BETTER YOU CLAIM YOU ARE, THE")
    print("FASTER YOU'LL HAVE TO BE WITH YOUR GUN TO BE SUCCESSFUL.")
    shootingExpertise = readInt()
    
    if shootingExpertise > 5 {
        shootingExpertise = 5
    }
}


/// Display a random string and measure how long it takes player to respond.
///
/// - Returns: reaction time, in seconds, minus shootingExpertise handicap
func shoot() -> Double {
    // 6130 REM ***SHOOTING SUB-ROUTINE***
    let gunShotSounds = ["BANG", "BLAM", "POW", "WHAM"]
    let index = rand.nextInt(upperBound: gunShotSounds.count)
    print("TYPE \(gunShotSounds[index])")
    let start = NSDate()
    let lineRead = readLine()
    let t = -start.timeIntervalSinceNow - Double(shootingExpertise) + 1
    if t < 0 {
        return 0.0
    }
    if lineRead != gunShotSounds[index] {
        return 9.0
    }
    return t
}

