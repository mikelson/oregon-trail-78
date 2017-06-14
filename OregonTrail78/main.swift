//
//  main.swift
//  OregonTrail78
//
//  Created by kaon on 5/17/17.
//
// Port of Creative Computing May-June 1978 Vol 4 No 3 pp 132 - 139 "Oregon Trail" by Dan Rawitsch
//
// PROGRAM NAME - OREGON VERSION 1 01/01/78
// ORIGINAL PROGRAMMING BY BILL HEINEMANN - 1971
// SUPPORT RESEARCH AND MATERIALS BY DON RAVITSCH.
// CDC CYBER 70/73-26 BASIC 3.1
// DOCUMENTATION BOOKLET 'OREQON' AVAILABLE FROM
// MINNES0TA EDUCATIONAL COMPUTING CONSORTIUM STAFF
// MECC SUPPORT SERVICES 2520 BROADWAY DRIVE ST. PAUL. MN 55113

import Foundation

showInstructions()

initShootingExpertise()

// "Global" constants

// 2 cents per bullet
let bulletsPerDollar = 50.0
let minEatingRate = 1
let southPassMileage = 950.0

// "Global" variables
var isInjured = false

// Can you visit a fort this turn? (Was "X1")
var isFortAvailable = false

// Do you have an illness? (Was "S4")
var isIll = false

// The first and only time you pass mileage 950, you face South Pass,
// where there's a high probability of blizzard.
// https://en.wikipedia.org/wiki/South_Pass_(Wyoming)
// ("didClearSouthPass" was "F1")
var didClearSouthPass = false

// Flag for clearing South Pass in setting mileage (was "M9")
var showSouthPassMileageNext = false

// The first and only time you pass mileage 1700, you face the Blue
// Mountains, where there's again a high probability of blizzard.
// https://en.wikipedia.org/wiki/Blue_Mountains_(Pacific_Northwest)
// ("didClearBlueMountains" was "F2")
var didClearBlueMountains = false

// Total mileage whole trip (was "M")
var mileage = 0.0

// Turn number for setting date (was "D3")
var turn = 0

let inventory = Inventory()

func getFoodConsumption(eatingRate: Int) -> Double {
    assert(eatingRate >= minEatingRate)
    return Double(8 + 5 * eatingRate)
}

// Main Turn Loop - runs until you die or reach Oregon City, i.e. exit()
while (true) {
    showDateCheckWinter()

    // 1740
    // ***BEGINNING EACH TURN***
    // 1750
    inventory.resetNegativesAndFractions()
    
    if inventory.food < getFoodConsumption(eatingRate: minEatingRate) {
        print("YOU'D BETTER DO SOME HUNTING OR BUY FOOD AND SOON!!!!")
    }

    mileage = int(mileage)
    
    // (mileageThroughPreviousTurn was "M2")
    let mileageThroughPreviousTurn = mileage
    
    // sick or injured?
    if isIll || isInjured {
        inventory.cash -= 20
        if inventory.cash < 0 {
            // 5080
            inventory.cash = 0
            print("YOU CAN'T AFFORD A DOCTOR")
            dieOfLackOfMedicalSupplies(injuries: isInjured)
        }
        print("DOCTOR'S BILL IS $20")
        isInjured = false
        isIll = false
    }

    // 1990
    if showSouthPassMileageNext {
        print("TOTAL MILEAGE IS \(Int(southPassMileage))")
        showSouthPassMileageNext = false
    } else {
        print("TOTAL MILEAGE IS \(Int(mileage))")
    }

    inventory.printSummary()
    
    chooseAction()

    if inventory.food < getFoodConsumption(eatingRate: minEatingRate) {
        print("YOU RAN OUT OF FOOD AND STARVED TO DEATH")
        die()
    }

    var eatingRate = chooseEatingRate()
    
    // Actually advance along the trail!
    mileage += 200 + (inventory.animals - 220) / 5 + 10 * nextRandomFraction()

    checkForRiders()
    
    checkForEvent(eatingRate: eatingRate)
    
    checkForMountains(eatingRate: eatingRate)
    
    checkForOregonCity(eatingRate: eatingRate, mileageThroughPreviousTurn: mileageThroughPreviousTurn)

    // 1240 ***SETTING DATE***
    turn += 1
} // end of main turn loop

