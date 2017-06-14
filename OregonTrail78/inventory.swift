//
//  inventory.swift
//  OregonTrail78
//
//  Created by kaon on 6/13/17.
//  Copyright © 2017 Peter Mikelsons. All rights reserved.
//

import Foundation

/// What's in your wagon?
class Inventory {
    static let wagonCost = 200.0
    static let startingCash = 700.0
    
    // Value of animals pulling the wagon, aka oxen (was "A")
    var animals = 0.0
    // Amount of food remaining (was "F")
    var food = 0.0
    // Bullets remaining (was "B")
    var bullets = 0.0
    // Value of clothing - protection against cold weather (was "C")
    var clothing = 0.0
    // Amount spent on "miscellaneous supplies" - basically medicine (was "M1")
    var misc = 0.0
    // Cash dollars remaining (was "T")
    var cash = startingCash
    
    init() {
        // INITIAL PURCHASE
        while true {
            print()
            print()
            while true {
                print("HOW MUCH DO YOU WANT TO SPEND ON YOUR OXEN TEAM")
                animals = readDouble()
                if animals < 200 {
                    print("NOT ENOUGH")
                    continue
                }
                if animals > 300 {
                    print("TOO MUCH")
                    continue
                }
                break;
            }
            
            func readPositiveDouble(question: String) -> Double {
                while true {
                    print(question)
                    let value = readDouble()
                    if (value < 0.0) {
                        print("IMPOSSIBLE")
                        continue
                    }
                    return value;
                }
            }
            food = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON FOOD")
            
            bullets = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON AMMUNITION")
            
            clothing = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON CLOTHING")
            
            misc = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON MISCELLANEOUS SUPPLIES")
            
            cash = Inventory.startingCash - animals - food - bullets - clothing - misc
            if cash < 0 {
                print("YOU OVERSPENT—YOU ONLY HAD $\(Int(Inventory.startingCash)) TO SPEND. BUY AGAIN")
                continue
            }
            print("AFTER ALL YOUR PURCHASES, YOU NOW HAVE \(Int(cash)) DOLLARS LEFT")
            break
        }
        bullets *= bulletsPerDollar
    }
    
    /// Set most values to 0 if negative, and round all values down to nearest integer.
    func resetNegativesAndFractions() {
        if food < 0 {
            food = 0
        }
        if bullets < 0 {
            bullets = 0
        }
        if clothing < 0 {
            clothing = 0
        }
        if misc < 0 {
            misc = 0
        }
        // Original code does not check for negative cash here
        food = int(food)
        bullets = int(bullets)
        clothing = int(clothing)
        misc = int(misc)
        cash = int(cash)
    }
    
    /// Display selected values and labels for the player.
    func printSummary() {
        // Note that "animals" is not printed, even though I want to know sometimes.
        print("FOOD  BULLETS  CLOTHING  MISC. SUPP.  CASH")
        print(String(format: "%4.0f  %7.0f  %8.0f  %11.0f  %4.0f", food, bullets, clothing, misc, cash))
    }
}
