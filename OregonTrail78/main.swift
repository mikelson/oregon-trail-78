//
//  main.swift
//  OregonTrail78
//
//  Created by kaon on 5/17/17.
//
// Port of Creative Computing May-June 1978 Vol 4 No 3 pp 132 - 139 "Oregon Trail" by Dan Rawitsch
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
    // 5170
    print()
    print("DUE T0 Y0UR UNFORTUNATE SITUATION, THERE ARE A FEW")
    print("FORMALITIES WE MUST GO THROUGH")
    print("WOULD YOU LIKE A MINISTER?")
    var C$ = readLine()
    print("WOULD YOU LIKE A FANCY FUNERAL?")
    C$ = readLine()
    print("WOULD YOU LIKE US TO INFORM YOUR NEXT OF KIN?")
    C$ = readLine()
    if C$ != "YES" {
        print("BUT YOUR AUNT SADIE IN ST. LOUIS IS REALLY WORRIED ABOUT YOU")
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

func dieOfInjuriesOrPneumonia(injuries: Bool) {
    // 5120
    print("YOU DIED OF ")
    print(injuries ? "INJURIES" : "PNEUMONIA")
    die()
}

func dieOfLackOfMedicalSupplies(injuries: Bool) {
    // 5110
    print("YOU RAN OUT OF MEDICAL SUPPLIES")
    dieOfInjuriesOrPneumonia(injuries: injuries)
}

let rand = GKARC4RandomSource()
func nextRandomFraction() -> Double {
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

if readLine() != "NO" {
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

print("HOW GOOD A SHOT ARE YOU WITH YOUR RIFLE?")
print(" (1) ACE MARKSMAN, (2) GOOD SHOT, (3) FAIR TO MIDDLIN'")
print(" (4) NEED MORE PRACTICE, (5) SHAKY KNEES")
print("ENTER ONE OF THE ABOVE -- THE BETTER YOU CLAIM YOU ARE, THE")
print("FASTER YOU'LL HAVE TO BE WITH YOUR GUN TO BE SUCCESSFUL.")
// "shootingExpertise" was "D9"
var shootingExpertise = readInt()
if shootingExpertise > 5 {
    shootingExpertise = 5
}

// 6130 REM ***SHOOTING SUB-ROUTINE***
func shoot() -> Double {
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

// INITIAL PURCHASE

var isInjured = false

// Can you visit a fort this turn? Formerly "X1"
var isFortAvailable = false
// Do you have an illness? Formerly "S4"
var isIll = false
// "didClearSouthPass" was formerly "F1"
var didClearSouthPass = false
// Flag for clearing Blue Mountains
// "F2"
var didClearBlueMountains = false
// Total mileage whole trip
var M = 0.0
// Flag for clearing South Pass in setting mileage, formerly "M9"
var showSouthPassMileageNext = false
// Turn number for setting date, formerly "D3"
var turn = 0

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
    print("AFTER ALL YOUR PURCHASES, YOU NOW HAVE \(T) DOLLARS LEFT")
    break
}
// 2 cents per bullet
B *= 50

// 1190
print()
print("MONDAY MARCH 29 1847")
print()

// Main Turn Loop
while (true) {
    // 1740
    // ***BEGINNING EACH TURN***
    // 1750
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
    if isIll || isInjured {
        T -= 20
        if T < 0 {
            // 5080
            T = 0
            print("YOU CAN'T AFFORD A DOCTOR")
            dieOfLackOfMedicalSupplies(injuries: isInjured)
        }
        print("DOCTOR'S BILL IS $20")
        isInjured = false
        isIll = false
    }
    // 1990
    if showSouthPassMileageNext {
        print("TOTAL MILEAGE IS 950")
        showSouthPassMileageNext = false
    } else {
        print("TOTAL MILEAGE IS \(M)")
    }
    func printInventory() {
        print("FOOD\tBULLETS\tCLOTHING\tMISC. SUPP.\tCASH")
        print("\(F)\t\t\(B)\t\(C)\t\t\t\(M1)\t\t\t\(T)")
    }
    printInventory()
    var X: Int
    if isFortAvailable {
        isFortAvailable = false
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
        isFortAvailable = true
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
                F += 52 + nextRandomFraction() * 6
                B -= 10 + nextRandomFraction() * 4
            }
        }
    }
    // 2720 continuing on
    if F < 13 {
        print("YOU RAN OUT OF FOOD AND STARVED TO DEATH")
        die()
    }
    // ***EATING***
    var E = 0
    while true {
        print("DO YOU WANT TO EAT (1) POORLY  (2) MODERATELY")
        print("OR (3) WELL")
        E = readInt()
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
    M += 200 + (A - 220) / 5 + 10 * nextRandomFraction()
    // FLAG FOR BLIZZARD
    var L1 = 0
    // FLAG FOR INSUFFICIENT CLOTHING IN COLD WEATHER
    var C1 = 0
    // ***RIDERS ATTACK***
    let riderMileageSquare = pow(M / 100 - 4, 2)
    if nextRandomFraction() * 10 <= (riderMileageSquare + 72) / (riderMileageSquare + 12) - 1 {
        print("RIDERS AHEAD.  THEY ")
        var S5 = 0
        if rand.nextBool() {
            print("DON'T")
            S5 = 1
        }
        print("LOOK HOSTILE")
        print("TACTICS")
        // T1 = CHOICE OF TACTICS WHEN ATTACKED
        var T1 = 0
        while T1 < 1 || T1 > 4 {
            print("(1) RUN  (2) ATTACK  (3) CONTINUE  (4) CIRCLE WAGONS")
            if nextRandomFraction() <= 0.2 {
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
                    isInjured = true
                    print("YOU HAVE TO SEE OL' DOC BLANCHARD")
                } else {
                    print("KINDA SLOW WITH YOUR COLT .45")
                }
            }
            if T1 < 2 {
                // run
                M += 20
                M1 -= 15
                B -= 150
                A -= 40
            } else if T1 == 2 {
                // attack
                let B1 = shoot()
                B -= B1 * 40 + 50
                shootRiders(B1: B1)
            } else if T1 == 3 {
                // continue
                if nextRandomFraction() <= 0.8 {
                    B -= 150
                    M1 -= 15
                } else {
                    // 3450
                    print("THEY DID NOT ATTACK")
                }
            } else {
                // circle wagons
                let B1 = shoot()
                B -= B1 * 30 + 50
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
                // run
                M += 15
                A -= 10
            } else if T1 == 2 {
                // attack
                M -= 5
                B -= 100
            } else if T1 == 4 {
                // circle wagons
                M -= 20
            }
            print("RIDERS WERE FRIENDLY, BUT CHECK FOR POSSIBLE LOSSES")
        }
    } // end of riders attack
    
    func illness() {
        // 6290 REM ***ILLNESS SUB-ROUTINE***
        // 6300
        var percent = 10 + 35.0 * Double(E - 1)
        if 100 * nextRandomFraction() < percent {
            print("MILD ILLNESS---MEDICINE USED")
            M -= 5
            M1 -= 2
        } else {
            percent = 100.0 - (40.0 / pow(4.0, Double(E) - 1.0))
            if 100 * nextRandomFraction() < percent {
                print("BAD ILLNESS---MEDICINE USED")
                M -= 5
                M1 -= 5
            } else {
                print("SERIOUS ILLNESS---")
                print("YOU MUST STOP FOR MEDICAL ATTENTION")
                M1 -= 10
                isIll = true
            }
        }
        // 6440
        // M1: amount spent on misc supplies
        if M1 < 0 {
            dieOfLackOfMedicalSupplies(injuries: isInjured)
        }
    }
    
    // 3540 ***SELECTION OF EVENTS***
    // D1 = COUNTER IN GENERATING EVENTS
    var D1 = 0
    // 3560 RESTORE
    var dataPointer = 0
    var R1 = 100 * nextRandomFraction()
    
    while true {
        D1 += 1
        if D1 == 16 {
            break;
        }
        let DATA = [6,11,13,15,17,22,32,35,37,42,44,54,64,69,95]
        var D = Double(DATA[dataPointer])
        // IF R1>D THEN 3580
        if R1 > D {
            continue;
        }
        switch (D1)
        {
        case 1:
            // 3660
            print("WAGON BREAKS DOWN--LOSE TIME AND SUPPLIES FIXING IT")
            M -= 15 + 5 * nextRandomFraction()
            M1 -= 8
            break
        case 2:
            // 3700
            print("OX INJURES LEG--SLOWS YOU DOWN REST OF TRIP")
            M -= 25
            A -= 20
            break
        case 3:
            // 3740
            print("BAD LUCK---YOUR DAUGHTER BROKE HER ARM")
            print("YOU HAD TO STOP AND USE SUPPLIES TO MAKE A SLING")
            M -= 5 + 4 * nextRandomFraction()
            M1 -= 2 + 3 * nextRandomFraction()
            break
        case 4:
            // 3790
            print("OX WANDERS OFF---SPEND TIME LOOKING FOR IT")
            M -= 17
            break
        case 5:
            // 3820
            print("YOUR SON GETS LOST---SPEND HALF THE DAY LOOKING FOR HIM")
            M -= 10
            break
        case 6:
            // 3850
            print("UNSAFE WATER--LOSE TIME LOOKING FOR CLEAN SPRING")
            M -= 10 * nextRandomFraction() + 2
            break
        case 7:
            // 3880
            if M <= 950 {
                print("HEAVY RAINS---TIME AND SUPPLIES LOST")
                F -= 10
                B -= 500
                M1 -= 15
                M -= 10 * nextRandomFraction() + 5
            } else {
                // 4490
                print("COLD WEATHER---BRRRRRRR!---YOU")
                if C <= 22 + 4 * nextRandomFraction() {
                    print("DON'T")
                    C1 = 1
                } // lse 4530
                print("HAVE ENOUGH CLOTHING TO KEEP YOU WARM")
                if C1 != 0 {
                    illness()
                }
            }
            break
        case 8:
            // 3960
            print("BANDITS ATTACK")
            var B1 = shoot()
            B -= 20 * B1
            if B >= 0 && B1 <= 1 {
                // 4100
                print("QUICKEST DRAW OUTSIDE OF DODGE CITY!!!")
                print("YOU GOT 'EM!")
            } else {
                if B < 0 {
                    // 4000
                    print("YOU RAN OUT OF BULLETS---THEY GET LOTS OF CASH")
                    // 4010
                    T /= 3
                }
                print("YOU GOT SHOT IN THE LEG AND THEY TOOK ONE OF YOUR OXEN")
                isInjured = true
                print("BETTER HAVE A DOC LOOK AT YOUR WOUND")
                M1 -= 5
                A -= 20
            }
            break
        case 9:
            // 4130
            print("THERE WAS A FIRE IN YOUR WAGON—FOOD AND SUPPLIES DAMAGE!")
            F -= 40
            B -= 400
            M1 -= nextRandomFraction() * 8 + 3
            M -= 15
            break
        case 10:
            // 4190
            print("LOSE YOUR WAY IN HEAVY FOG---TIME IS LOST")
            M -= 10 + 5 * nextRandomFraction()
            break
        case 11:
            // 4220
            print("YOU KILLED A POISONOUS SNAKE AFTER IT BIT YOU")
            B -= 10
            M1 -= 5
            if M1 < 0 {
                print("YOU DIE OF SNAKEBITE SINCE YOU HAVE NO MEDICINE")
                die()
            }
            break
        case 12:
            // 4290
            print("WAGON GETS SWAMPED FORDING RIVER--LOSE FOOD AND CLOTHES")
            F -= 30
            C -= 20
            M -= 20 + 20 * nextRandomFraction()
            break
        case 13:
            // 4340
            print("WILD ANIMALS ATTACK!")
            var B1 = shoot()
            if B < 40 {
                print("YOU WERE TOO LOW ON BULLETS")
                print("THE WOLVES OVERPOWERED YOU")
                isInjured = true
                dieOfInjuriesOrPneumonia(injuries: true)
            }
            if B1 <= 2 {
                print("NICE SHOOTIN' PARDNER---THEY DIDN'T GET MUCH")
            } else {
                print("SLOW ON THE DRAW---THEY GOT AT YOUR FOOD AND CLOTHES")
            }
            B -= 20 * B1
            C -= B * 4
            F -= B1 * 8
            break
        case 14:
            // 4560
            print("HAIL STORM---SUPPLIES DAMAGED")
            M -= 5 + nextRandomFraction() * 10
            B -= 200
            M1 -= 4 + nextRandomFraction() * 3
            break
        case 15:
            // 4610
            if E == 1 {
                illness()
            } else if E != 3 {
                if nextRandomFraction() > 0.25 {
                    illness()
                }
            } else if nextRandomFraction() < 0.5 {
                illness()
            }
            break
        case 16:
            // 4670
            print("HELPFUL INDIANS SHOW YOU WHERE TO FIND MORE FOOD")
            F += 14
            break
        default:
            print("unexpected event: \(D1)")
            break
        }
    } // end while true
    
    func blizzardInMountainPass() {
        // 4970
        print("BLIZZARD IN MOUNTAIN PASS--TIME AND SUPPLIES LOST")
        // L1: flag for blizzard
        L1 = 1
        F -= 25
        M1 -= 10
        B -= 300
        M -= 30 + 40 * nextRandomFraction()
        // 5030
        if C < 18 + 2 * nextRandomFraction() {
            illness()
        }
    }
    
    func checkForClearingPasses() {
        // 4900
        if M >= 1700 && !didClearBlueMountains {
            // 4920
            didClearBlueMountains = true
            // 4930
            if nextRandomFraction() < 0.7 {
                // 4970
                blizzardInMountainPass()
            }
        }
        // 4940
        if M <= 950 {
            showSouthPassMileageNext = true
        }
    }
    
    func clearSouthPass() {
        // 4860
        if !didClearSouthPass {
            didClearSouthPass = true
            // 4880
            if nextRandomFraction() < 0.8 {
                blizzardInMountainPass()
            } else {
                // 4890
                print("YOU MADE IT SAFELY THROUGH SOUTH PASS--NO SNOW")
            }
        }
        // 4900
        return checkForClearingPasses()
    }
    
    // 4700 ***MOUNTAINS***
    // 4710
    if M > 950 {
        // 4720
        var square = pow(M / 100 - 15, 2.0)
        // At M==950, nextRandomFraction()*10 must be <= 6.58 for rugged mountains
        // At M==1200, rhs==5.14
        // At M==1500, square is 0, rhs==3
        // At M==1800, rhs==5.14
        // Distribution is V shaped trough with minimum at M==1500 and maximum of 8 for large M.
        // See "Occurrence of 'Rugged Mountains' as a function of mileage" in the paper.
        if nextRandomFraction() * 10 <= 9 - (square + 72)/(square + 12) {
            print("RUGGED MOUNTAINS")
            if nextRandomFraction() <= 0.1 {
                // 4750
                print("YOU GOT LOST---LOSE VALUABLE TIME TRYING TO FIND TRAIL!")
                M -= 60
            } else {
                // 4780
                if nextRandomFraction() <= 0.11 {
                    print("WAGON DAMAGED!---LOSE TIME AND SUPPLIES")
                    M1 -= 5
                    B -= 200
                    M -= 20 + 30 * nextRandomFraction()
                } else {
                    // 4840
                    print("THE GOING GETS SLOW")
                    // 4850
                    M -= 45 + nextRandomFraction() / 0.02
                }
            }
            
        }
        // 4860
        clearSouthPass()
    }
    // 1230
    if M >= 2040 {
        // 5420 ***FINAL TURN***
        // 5430
        // F9: fraction of two weeks traveled on final turn
        var F9 = (2040 - M2) / (M - M2)
        let inverse = 1 - F9
        F += inverse * (8.0 + 5.0 * Double(E))
        print()
        // 5470
        print("YOU FINALLY ARRIVED AT OREGON CITY")
        print("AFTER 2040 LONG MILES---HOORAY!!!!!")
        print("A REAL PIONEER!")
        print()
        // 5510
        F9 = int(value:F9 * 14)
        var day = turn * 14 + Int(F9)
        F9 += 1
        if F9 >= 8 {
            F9 -= 7
        }
        let daysOfWeek = [
            "MONDAY",
            "TUESDAY",
            "WEDNESDAY",
            "THURSDAY",
            "FRIDAY",
            "SATURDAY",
            "SUNDAY",
        ]
        print("\(daysOfWeek[Int(F9)]) ")
        // 5700
        if day <= 124 {
            day -= 93
            print("JULY \(day) 1847")
        } else if day <= 155 {
            day -= 124
            print("AUGUST \(day) 1847")
        } else if day <= 185 {
            day -= 155
            print("SEPTEMBER \(day) 1847")
        } else if day <= 216 {
            day -= 185
            print("OCTOBER \(day) 1847")
        } else if day <= 246 {
            day -= 216
            print("NOVEMBER \(day) 1847")
        } else {
            day -= 246
            print("DECEMBER \(day) 1847")
        }
        // 5920
        print()
        B = max(B, 0)
        C = max(C, 0)
        M1 = max(M1, 0)
        T = max(T, 0)
        F = max(F, 0)
        printInventory()
        print()
        print("           PRESIDENT JAMES K. POLK SENDS YOU HIS")
        print("                 HEARTIEST CONGRATULATIONS")
        print()
        print("           AND WISHES YOU A PROSPEROUS LIFE AHEAD")
        print()
        print("                      AT YOUR NEW HOME")
        exit(1)
    }
    // 1240 ***SETTING DATE***
    turn += 1
    print()
    let validDates = [
        "APRIL 12",
        "APRIL 26",
        "MAY 10",
        "MAY 24",
        "JUNE 7",
        "JUNE 21",
        "JULY 5",
        "JULY 19",
        "AUGUST 2",
        "AUGUST 16",
        "AUGUST 31",
        "SEPTEMBER 13",
        "SEPTEMBER 27",
        "OCTOBER 11",
        "OCTOBER 25",
        "NOVEMBER 8",
        "NOVEMBER 22",
        "DECEMBER 6",
        "DECEMBER 20",
    ]
    if turn >= validDates.count {
        print("YOU HAVE BEEN ON THE TRAIL TOO LONG  ------")
        print("YOUR FAMILY DIES IN THE FIRST BLIZZARD OF WINTER")
        die()
    }
    print("MONDAY \(validDates[turn]) 1847")
    // 1730
    print()
} // end of main turn loop
