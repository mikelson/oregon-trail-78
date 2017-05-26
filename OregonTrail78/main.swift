//
//  main.swift
//  OregonTrail78
//
//  Created by kaon on 5/17/17.
//  Copyright © 2017 Peter Mikelsons. All rights reserved.
//

import Foundation
import GameplayKit

func readInt() -> Int {
    let line = readLine()
    if line != nil {
        return Int(line!) ?? 0
    }
    return 0
}

func readDouble() -> Double {
    let line = readLine()
    if line != nil {
        return Double(line!) ?? 0.0
    }
    return 0.0
}

func int(value: Double) -> Double {
    if value < 0.0 {
        // round towards zero
        return floor(value) + 1
    }
    return floor(value)
}

func die() {
    print()
    print("DUE T0 Y0UR UNF0RTUNATE SITUATION, THERE ARE A FEW")
    print("FORMALITIES WE MUST GO THROUGH")
    print("WOULD YOU LIKE A MINISTER?")
    var C$ = readLine()
    print("WOULD YOU LIKE A FANCY FUNERAL?")
    C$ = readLine()
    print("WOULD YOU LIKE US TO INFORM YOUR NEXT OF KIN?")
    C$ = readLine()
    if C$ != "YES" {
        print("BUT YOUR AUNT SADIE IN ST. L6U1S IS REALLY WORRIED ABOUT YOU")
    } else {
        print("THAT WILL BE $4.50 FOR THE TELEGRAPH CHARGE.")    
    }
    print()
    print("WE THANK YOU FOR THIS INFORMATION AND WE ARE SORRY YOU")
    print("DIDN'T MAKE IT TO THE GREAT TERRITORY 8F OREGON")
    print("BETTER LUCK NEXT TIME")
    print()
    print()
    print("                              SINCERELY")
    print()
    print("                 THE OREGON CITY CHAMBER OF COMMERCE")
    exit(0)
}

let rand = GKARC4RandomSource()
func RND() -> Double {
    return Double(rand.nextUniform())
}

// PROGRAM NAME - OREGON VERSION 1 01/01/78
// ORIGINAL PROGRAMMING BY BILL HEINEMANN - 1971
// SUPPORT RESEARCH AND MATERIALS BY DON RAVITSCH.
// CDC CYBER 70/73-26 BASIC 3.1
// DOCUMENTATION BOOKLET 'OREQON' AVAILABLE FROM
// MINNES0TA EDUCATIONAL COMPUTING CONSORTIUM STAFF
// MECC SUPPORT SERVICES 2520 BROADWAY DRIVE ST. PAUL. MN 55113
print("DO YOU NEED INSTRUCTIONS (YES/NO)")

let C$ = readLine();

if C$ != "NO" {
    print("THIS PROGRAM SIMULATES A TRIP OVER THE OREGON TRAIL FROM")
    print("INDEPENDENCE, MISSOURI TO OREGON CITY, OREGON IN 1847.")
    print("YOUR FAMILY OF—FIVE BILL COVER THE 2040 NILE OREGON TRAIL")
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
    // TODO Food ammunition clothing misc
    print("YOU CAN SPEND ALL YOUR MONEY BEFORE YOU START YOW-R TRIP -")
    print("OR YOU CAN SAVE SOME OF YOUR CASH TO SPEND AT FORTS ALONG")
    print("THE WAY WHEN Y9U RUN LOW. H0WEVER* ITEMS COST MORE AT")
    print("THE FORTS. YOU CAN ALSO GO HUNTING ALONG THE WAY TO GET")
    print("MORE FOOD.")
    print("WHENEVER YOU HAVE TO USE YOUR TRUSTY RIFLE ALONG THE WAY*")
    print("YOU WILL BE TOLD TO TYPE IN A WORD (ONE THAT SOUNDS LIKE A")
    print("GUN SHOT). THE FASTER YOU TYPE IN THAT WORD AND HIT THE")
    print("\"RETURN\" KEY, THE BETTER LUCK YOU'LL HAVE WITH YOUR GUN.")
    print()
    print("AT EACH TURN* ALL ITEMS ARE SHOWN IN DOLLAR AMOUNTS")
    print("EXCEPT BULLETS")
    print("WHEN ASKED TO ENTER MONEY AMOUNTS, DON'T USE A $.")
    print()
    print("GOOD LUCK!!!")
    print()
}

print("HOW GOOD A SHOT ARE YOU WITH YOUR RIFLE?")
print(" (1) ACE MARKSMAN, (2) GOOD SHOT, (3) FAIR TO MIDDLIN'")
print(" (4) NEED MORE PRACTICE, (5) SHAKY KNEES")
print("ENTER ONE OF THE ABOVE -- THE BETTER YOU CLAIM YOU ARE, THE")
print("FASTER YOU'LL HAVE TO BF WITH YOUR GUN TO BE SUCCESSFUL.")
var D9 = readInt()
if D9 > 5 {
    D9 = 5
}

// 6130 REM ***SHOOTING SUB-ROUTINE***
func shoot() -> Double {
    let S$ = ["BANG", "BLAM", "POW", "WHAM"]
    let S6 = rand.nextInt(upperBound: S$.count)
    print("TYPE \(S$[S6])")
    let start = NSDate()
    let C$ = readLine()
    let t = start.timeIntervalSinceNow
    let B1 = t - Double(D9) + 1
    print(B1)
    print()
    if B1 < 0 {
        return 0.0
    }
    if C$ != S$[S6] {
        return 9.0
    }
    return B1
}

// INITIAL PURCHASE

// Flag for Fort Option
var X1 = -1
// Flag for injury
var K8 = 0
// Flag for illness
var S4 = 0
// Flag for clearing South Pass
var F1 = 0
// Flag for clearing Blue Mountains
var F2 = 0
// Total mileage whole trip
var M = 0.0
// Flag for clearing South Pass in setting mileage
var M9 = 0
// Turn number for setting date
var D3 = 0

// A AMOUNT SPENT ON ANIMALS
var A = 0.0
var F = 0.0
var B = 0.0
var C = 0.0
var M1 = 0.0
// T • CASH LEFT OVER AFTER INITIAL PURCHASES
var T = 700.0
while true {
    print()
    print()
    while true {
        print("HOW MUCH DO YOU WANT TO SPEND ON YOUR OXEN TEAM")
        A = readDouble()
        if A < 200 {
            print("NOT ENOUGH")
            continue
        }
        if A > 300 {
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
    F = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON FOOD")
    
    B = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON AMMUNITION")
    
    C = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON CLOTHING")
    
    M1 = readPositiveDouble(question: "HOW MUCH DO YOU WANT TO SPEND ON MISCELLANEOUS SUPPLIES")
    
    T = 700.0 - A - F - B - C - M1
    if T < 0 {
        print("YOU OVERSPENT—YOU ONLY HAD $700 TO SPEND. BUY AGAIN")
        continue
    }
    print("AFTER ALL YOUR PURCHASES* YOU NOW HAVE \(T) DOLLARS LEFT")
    break
}
// 2 cents per bullet
B *= 50

print()
print("MONDAY MARCH 29 1847")
print()

// Beginning each turn
if F < 0 {
    F = 0
}
if B < 0 {
    B = 0
}
if C < 0 {
    C = 0
}
if M1 < 0 {
    M1 = 0
}
if F < 13 {
    print("YOU'D BETTER DO SOME HUNTING OR BUY FOOD AND SOON!!!!")
}
F = int(value: F)
B = int(value: B)
C = int(value: C)
M1 = int(value: M1)
T = int(value: T)
M = int(value: M)

// M2 • TOTAL MILEAGE UP THROUGH PREVIOUS TURN
let M2 = M

// sick or injured?
if S4 == 1 || K8 == 1 {
    T -= 20
    if T < 0 {
        // 5080
        T = 0
        print("YOU CAN'T AFFORD A DOCTOR")
        print("YOU RAN OUT OF MEDICAL SUPPLIES")
        print("YOU DIED OF ")
        print(K8 == 1 ? "INJURIES" : "PNEUMONIA")
        die()
    }
    print("DOCTOR'S BILL IS $20")
    K8 = 0
    S4 = 0
}
// 1990
if M9 == 1 {
    print("TOTAL MILEAGE IS 950")
    M9 = 0
} else {
    print("TOTAL MILEAGE IS \(M)")
}
print("FOOD\tBULLETS\tCLOTHING\tMISC. SUPP.\tCASH")
print("\(F)\t\t\(B)\t\(C)\t\t\t\(M1)\t\t\t\(T)")
var X: Int
if X1 != -1 {
    X1 *= -1
    print("DO YOU WANT TO (1) STOP AT THE NEXT FORT, (2) HUNT,")
    print("OR (3) CONTINUE");
    X = readInt()
    if X < 1 || X > 3{
        X = 3
    }
} else {
    print("DO YOU WANT TO (1) HUNT, OR (2) CONTINUE")
    X = readInt()
    if X != 1 {
        X = 2
    }
    X += 1
    if X == 2 && B < 40 {
        print("TOUGH---YOU NEED MORE (at least 40) BULLETS TO GO HUNTING")
        X = 3
    }
    X1 *= -1
}
// 2270 switch
if X == 1 {
    // ***STOPPING AT FORT***
    print("ENTER WHAT YOU WISH TO SPEND ON THE FOLLOWING")
    func spend() -> Double {
        var P = readDouble()
        if P < 0 {
            // keeping this interesting exploit
            return P
        }
        T -= P
        if T >= 0 {
            return P
        }
        print("YOU DON'T HAVE THAT MUCH--KEEP YOUR SPENDING DOWN")
        print("YOU MISS YOUR CHANCE TO SPEND ON THAT ITEM")
        T += P
        P = 0
        return 0
    }
    print("FOOD")
    F += 2 / 3 * spend()
    print("AMMUNITION")
    B = int(value: B + 2 / 3 * spend() * 50)
    print("CLOTHING")
    C += 2 / 3 * spend()
    print("MISCELLANEOUS SUPPLIES")
    M1 += 2 / 3 * spend()
    M -= 45
} else if X == 2 {
    // ***HUNTING***
    if B < 40 {
        print("TOUGH---YOU NEED MORE (at least 40) BULLETS TO GO HUNTING")
        // Basic code is GOTO 2080, which could let you stop at fort, even if it is not a fort turn...
        // TODO just don't show hunt option if B < 40
        // for now, just continue...
    } else {
        M -= 45
        // 2580 GOSUB 6140
        var B1 = shoot()
        if B1 > 1 {
            if 100.0 * Double(rand.nextUniform()) < 13.0 * B1 {
                print("YOU MISSED---AND YOUR DINNER GOT AWAY.....")
            } else {
                F += 48 - 2 * B1
                print("NICE SHOT--RIGHT ON TARGET--GOOD EATIN' TONIGHT!!")
                B -= 10 + 3 * B1
            }
        } else {
            print("RIGHT BETWEEN THE EYES---YOU GOT A BIG ONE!!!!")
            print("FULL BELLIES TONIGHT!")
            F += 52 + RND() * 6
            B -= 10 + RND() * 4
        }
    }
}
// 2720 continuing on
if F < 13 {
    print("YOU RAN OUT OF FOOD AND STARVED TO DEATH")
    die()
}
// ***EATING***
while true {
    print("DO YOU WANT TO EAT (1) POORLY  (2) MODERATELY")
    print("OR (3) WELL")
    var E = readInt()
    if E < 1 || E > 3 {
        continue
    }
    F -= Double(8 + 5 * E)
    if F < 0 {
        F += Double(8 + 5 * E)
        print("YOU CAN'T EAT THAT WELL")
        continue
    }
    break
}
M += 200 + (A - 220) / 5 + 10 * RND()
// FLAG FOR BLIZZARD
var L1 = 0
// FLAG FOR INSUFFICIENT CLOTHING IN COLD WEATHER
var C1 = 0
// ***RIDERS ATTACK***
let riderMileageSquare = pow(M / 100 - 4, 2)
if RND() * 10 <= (riderMileageSquare + 72) / (riderMileageSquare + 12) - 1 {
    print("RIDERS AHEAD.  THEY ")
    var S5 = 0
    if rand.nextBool() {
        print("DON'T")
        S5 = 1
    }
    print("LOOK HOSTILE")
    print("TACTICS")
    var T1 = 0
    while T1 < 1 || T1 > 4 {
        print("(1) RUN  (2) ATTACK  (3) CONTINUE  (4) CIRCLE WAGONS")
        if RND() <= 0.2 {
            S5 = 1 - S5
        }
        T1 = readInt()
    }
    if S5 != 1 {
        func shootRiders(B1: Double) {
            if B1 <= 1 {
                print("NICE SHOOTING---YOU DROVE THEM OFF")
            } else if B1 > 5 {
                print("LOUSY SHOT---YOU GOT KNIFED")
                K8 =  1
                print("YOU HAVE TO SEE OL' DOC BLANCHARD")
            } else {
                print("KINDA SLOW WITH YORU COLT .45")
            }
        }
        if T1 < 2 {
            M += 20
            M1 -= 15
            B -= 150
            A -= 40
        } else if T1 == 2 {
            let B1 = shoot()
            B -= B1 * 40 - 50
            shootRiders(B1: B1)
        } else if T1 == 3 {
            if RND() <= 0.8 {
                B -= 150
                M1 -= 15
            } else {
                // 3450
                print("THEY DID NOT ATTACK")
            }
        } else {
            // T1 == 4
            let B1 = shoot()
            B -= B1 * 30 - 50
            M -= 25
            shootRiders(B1: B1)
        }
        print("RIDERS WERE HOSTILE-- CHECK FOR LOSSES")
        if B < 0 {
            print("YOU RAN OUT OF BULLETS AND GOT MASSACRED BY THE RIDERS")
            die()
        }
    } else {
        // not hostile
        if T1 < 2 {
            M += 15
            A -= 10
        } else if T1 == 2 {
            M -= 5
            B -= 100
        } else if T1 == 4 {
            M -= 20
        }
        print("RIDERS WERE FRIENDLY, BUT CHECK FOR POSSIBLE LOSSES")
    }
} // end of riders attack

// 3540 ***SELECTION OF EVENTS***
