//
//  death.swift
//  OregonTrail78
//
//  Created by kaon on 6/13/17.
//  Copyright © 2017 Peter Mikelsons. All rights reserved.
//

import Foundation

/// Display sad message and exit with code 0.
func die() {
    // 5170
    print()
    print("DUE T0 YOUR UNFORTUNATE SITUATION, THERE ARE A FEW")
    print("FORMALITIES WE MUST GO THROUGH")
    print("WOULD YOU LIKE A MINISTER?")
    var lineRead = readLine()
    print("WOULD YOU LIKE A FANCY FUNERAL?")
    lineRead = readLine()
    print("WOULD YOU LIKE US TO INFORM YOUR NEXT OF KIN?")
    lineRead = readLine()
    if lineRead != "YES" {
        print("BUT YOUR AUNT SADIE IN ST. LOUIS IS REALLY WORRIED ABOUT YOU")
    } else {
        print("THAT WILL BE $4.50 FOR THE TELEGRAPH CHARGE.")
    }
    print()
    print("WE THANK YOU FOR THIS INFORMATION AND WE ARE SORRY YOU")
    print("DIDN'T MAKE IT TO THE GREAT TERRITORY OF OREGON")
    print("BETTER LUCK NEXT TIME")
    print()
    print()
    print("                              SINCERELY")
    print()
    print("                 THE OREGON CITY CHAMBER OF COMMERCE")
    exit(0)
}

/// Display message about cause of death, and die.
func dieOfInjuriesOrPneumonia(injuries: Bool) {
    // 5120
    print("YOU DIED OF ")
    print(injuries ? "INJURIES" : "PNEUMONIA")
    die()
}

/// Display message about cause of death, and die.
func dieOfLackOfMedicalSupplies(injuries: Bool) {
    // 5110
    print("YOU RAN OUT OF MEDICAL SUPPLIES")
    dieOfInjuriesOrPneumonia(injuries: injuries)
}

