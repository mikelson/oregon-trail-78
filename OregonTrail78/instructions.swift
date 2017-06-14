//
//  introduction.swift
//  OregonTrail78
//
//  Created by kaon on 6/13/17.
//  Copyright © 2017 Peter Mikelsons. All rights reserved.
//

import Foundation

/// Check if player wants to read the instructions.
func showInstructions() {
    print("DO YOU NEED INSTRUCTIONS (YES/NO)")
    
    if readLine() == "NO" {
        return
    }
    print("THIS PROGRAM SIMULATES A TRIP OVER THE OREGON TRAIL FROM")
    print("INDEPENDENCE, MISSOURI TO OREGON CITY, OREGON IN 1847.")
    print("YOUR FAMILY OF FIVE WILL COVER THE 2040 MILE OREGON TRAIL")
    print("IN 5-6 MONTHS --- IF YOU MAKE IT ALIVE.")
    print()
    print("YOU HAD SAVED $900 TO SPEND FOR THE TRIP, AND YOU'VE JUST")
    print("   PAID $200 FOR A WAGON.")
    print("YOU WILL NEED TO SPEND THE REST OF YOUR MONEY ON THE")
    print("   FOLLOWING ITEMS:")
    print()
    print("     OXEN - YOU CAN SPEND $200-$300 ON YOUR TEAM")
    print("            THE MORE YOU SPEND, THE FASTER YOU'LL GO")
    print("            BECAUSE YOU'LL HAVE BETTER ANIMALS")
    print()
    print("     FOOD - THE MORE YOU HAVE, THE LESS CHANCE THERE")
    print("            IS OF GETTING SICK")
    print()
    print("     AMMUNITION - $1 BUYS A BELT OF 50 BULLETS")
    print("            YOU WILL NEED BULLETS FOR ATTACKS BY ANIMALS")
    print("            AND BANDITS, AND FOR HUNTING TRIPS")
    print()
    print("     CLOTHING - THIS IS ESPECIALLY IMPORTANT FOR THE COLD")
    print("            WEATHER YOU WILL ENCOUNTER WHEN CROSSING")
    print("            THE MOUNTAINS")
    print()
    print("     MISCELLANEOUS SUPPLIES - THIS INCLUDES MEDICINE AND")
    print("            OTHER THINGS YOU WILL NEED FOR SICKNESS")
    print("            AND EMERGENCY REPAIRS")
    print()
    print()
    print("YOU CAN SPEND ALL YOUR MONEY BEFORE YOU START YOUR TRIP -")
    print("OR YOU CAN SAVE SOME OF YOUR CASH TO SPEND AT FORTS ALONG")
    print("THE WAY WHEN YOU RUN LOW. HOWEVER, ITEMS COST MORE AT")
    print("THE FORTS. YOU CAN ALSO GO HUNTING ALONG THE WAY TO GET")
    print("MORE FOOD.")
    print("WHENEVER YOU HAVE TO USE YOUR TRUSTY RIFLE ALONG THE WAY,")
    print("YOU WILL BE TOLD TO TYPE IN A WORD (ONE THAT SOUNDS LIKE A")
    print("GUN SHOT). THE FASTER YOU TYPE IN THAT WORD AND HIT THE")
    print("\"RETURN\" KEY, THE BETTER LUCK YOU'LL HAVE WITH YOUR GUN.")
    print()
    print("AT EACH TURN, ALL ITEMS ARE SHOWN IN DOLLAR AMOUNTS")
    print("EXCEPT BULLETS")
    print("WHEN ASKED TO ENTER MONEY AMOUNTS, DON'T USE A \"$\".")
    print()
    print("GOOD LUCK!!!")
    print()
}
