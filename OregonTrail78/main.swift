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
import GameplayKit

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

let rand = GKARC4RandomSource()

/// Return a Double within the uniform range [0.0...1.0].
func nextRandomFraction() -> Double {
    return Double(rand.nextUniform())
}

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
// ("shootingExpertise" was "D9")
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

// 2 cents per bullet
let bulletsPerDollar = 50.0

// What's in your wagon?
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
let inventory = Inventory()

let minEatingRate = 1
func getFoodConsumption(eatingRate: Int) -> Double {
    assert(eatingRate >= minEatingRate)
    return Double(8 + 5 * eatingRate)
}

// Main Turn Loop
while (true) {
    print()
    let validDates = [
        "MARCH 29",
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
    let southPassMileage = 950.0
    if showSouthPassMileageNext {
        print("TOTAL MILEAGE IS \(Int(southPassMileage))")
        showSouthPassMileageNext = false
    } else {
        print("TOTAL MILEAGE IS \(Int(mileage))")
    }

    inventory.printSummary()
    
    // Let user choose an action for this turn
    enum Action: Int {
        case stopAtFort = 1, hunt, continueOn
    }
    var action: Action
    repeat {
        if isFortAvailable {
            print("DO YOU WANT TO (1) STOP AT THE NEXT FORT, (2) HUNT,")
            print("OR (3) CONTINUE");
            action = Action(rawValue: readInt()) ?? Action.continueOn
        } else {
            print("DO YOU WANT TO (1) HUNT, OR (2) CONTINUE")
            let intRead = readInt()
            action = intRead == 0 ? Action.continueOn : (Action(rawValue: intRead + 1) ?? Action.continueOn)
        }
        if action == Action.hunt && inventory.bullets < 40 {
            print("TOUGH---YOU NEED MORE (at least 40) BULLETS TO GO HUNTING")
            if (isFortAvailable) {
                // Let user pick from stop or hunt.
                continue
            }
            // No fort... automatically assign the only option
            action = Action.continueOn
        }
        isFortAvailable = !isFortAvailable
        break
    } while true
    // 2270 switch
    switch action {
    case Action.stopAtFort:
        print("ENTER WHAT YOU WISH TO SPEND ON THE FOLLOWING")
        func spend() -> Double {
            var P = readDouble()
            if P < 0 {
                // This is how the original works. Spending negative amounts reduces your inventory
                // and does not give you any cash!
                return P
            }
            inventory.cash -= P
            if inventory.cash >= 0 {
                return P
            }
            print("YOU DON'T HAVE THAT MUCH--KEEP YOUR SPENDING DOWN")
            print("YOU MISS YOUR CHANCE TO SPEND ON THAT ITEM")
            inventory.cash += P
            P = 0
            return 0
        }
        // Fort stores only give you 2/3 for your dollar.
        let fortInflation = 2.0 / 3.0
        print("FOOD")
        inventory.food += fortInflation * spend()
        print("AMMUNITION")
        inventory.bullets = int(inventory.bullets + fortInflation * spend() * bulletsPerDollar)
        print("CLOTHING")
        inventory.clothing += fortInflation * spend()
        print("MISCELLANEOUS SUPPLIES")
        inventory.misc += fortInflation * spend()
        mileage -= 45
    case Action.hunt:
        mileage -= 45
        // 2580 GOSUB 6140
        var shotSpeed = shoot()
        if shotSpeed > 1 {
            if 100.0 * Double(rand.nextUniform()) < 13.0 * shotSpeed {
                print("YOU MISSED---AND YOUR DINNER GOT AWAY.....")
            } else {
                inventory.food += 48 - 2 * shotSpeed
                print("NICE SHOT--RIGHT ON TARGET--GOOD EATIN' TONIGHT!!")
                inventory.bullets -= 10 + 3 * shotSpeed
            }
        } else {
            print("RIGHT BETWEEN THE EYES---YOU GOT A BIG ONE!!!!")
            print("FULL BELLIES TONIGHT!")
            inventory.food += 52 + nextRandomFraction() * 6
            inventory.bullets -= 10 + nextRandomFraction() * 4
        }
    case Action.continueOn:
        break
    }
    
    if inventory.food < getFoodConsumption(eatingRate: minEatingRate) {
        print("YOU RAN OUT OF FOOD AND STARVED TO DEATH")
        die()
    }

    // ***EATING***
    // Eating poorly (1) greatly increases the likelihood and severity of illness.
    // Eating well (3) decreases the probablity and severity of illness.
    var eatingRate = 0
    
    while true {
        print("DO YOU WANT TO EAT (1) POORLY  (2) MODERATELY")
        print("OR (3) WELL")
        eatingRate = readInt()
        if eatingRate < minEatingRate || eatingRate > 3 {
            continue
        }
        // Consume 13, 18, or 23 foods
        let food = inventory.food - getFoodConsumption(eatingRate: eatingRate)
        if food < 0.0 {
            print("YOU CAN'T EAT THAT WELL")
            continue
        }
        inventory.food = food
        break
    }

    // Actually advance along the trail!
    mileage += 200 + (inventory.animals - 220) / 5 + 10 * nextRandomFraction()

    // ***RIDERS ATTACK***
    let riderMileageSquare = pow(mileage / 100 - 4, 2)
    if nextRandomFraction() * 10 <= (riderMileageSquare + 72) / (riderMileageSquare + 12) - 1 {
        print("RIDERS AHEAD.  THEY ")
        // (was "S5")
        var isFriendly = false
        if rand.nextBool() {
            print("DON'T")
            isFriendly = true
        }
        print("LOOK HOSTILE")
        print("TACTICS")
        // (was "T1")
        enum Tactics: Int {
            case invalid = 0, run, attack, continueOn, circleWagons
        }
        var tactics = Tactics.invalid
        while tactics == Tactics.invalid {
            print("(1) RUN  (2) ATTACK  (3) CONTINUE  (4) CIRCLE WAGONS")
            if nextRandomFraction() <= 0.2 {
                isFriendly = !isFriendly
            }
            tactics = Tactics(rawValue: readInt()) ?? Tactics.invalid
        }
        if !isFriendly {
            func shootRiders(shotSpeed: Double) {
                if shotSpeed <= 1 {
                    print("NICE SHOOTING---YOU DROVE THEM OFF")
                } else if shotSpeed > 5 {
                    print("LOUSY SHOT---YOU GOT KNIFED")
                    isInjured = true
                    print("YOU HAVE TO SEE OL' DOC BLANCHARD")
                } else {
                    print("KINDA SLOW WITH YOUR COLT .45")
                }
            }
            switch tactics {
            case Tactics.attack:
                let shotSpeed = shoot()
                inventory.bullets -= shotSpeed * 40 + 50
                shootRiders(shotSpeed: shotSpeed)
            case Tactics.continueOn:
                if nextRandomFraction() <= 0.8 {
                    inventory.bullets -= 150
                    inventory.misc -= 15
                } else {
                    // 3450
                    print("THEY DID NOT ATTACK")
                }
            case Tactics.circleWagons:
                let shotSpeed = shoot()
                inventory.bullets -= shotSpeed * 30 + 50
                mileage -= 25
                shootRiders(shotSpeed: shotSpeed)
            default:
                // run or invalid
                mileage += 20
                inventory.misc -= 15
                inventory.bullets -= 150
                inventory.animals -= 40
            }
            print("RIDERS WERE HOSTILE-- CHECK FOR LOSSES")
            if inventory.bullets < 0 {
                print("YOU RAN OUT OF BULLETS AND GOT MASSACRED BY THE RIDERS")
                die()
                // I guess if you chose CONTINUE and they did not attack, they somehow sensed your
                // lack of bullets, changed their minds, and attacked anyway?
            }
        } else {
            // not hostile
            switch tactics {
            case Tactics.run:
                // run or invalid
                mileage += 15
                inventory.animals -= 10
            case Tactics.attack:
                mileage -= 5
                inventory.bullets -= 100
            case Tactics.circleWagons:
                mileage -= 20
            default:
                // continueOn or invalid
                break
            }
            print("RIDERS WERE FRIENDLY, BUT CHECK FOR POSSIBLE LOSSES")
        }
    } // end of riders attack
    
    func illness() {
        // 6290 REM ***ILLNESS SUB-ROUTINE***
        // 6300
        // 10, 45, or 80
        var percent = 10 + 35.0 * Double(eatingRate - minEatingRate)
        if 100 * nextRandomFraction() < percent {
            print("MILD ILLNESS---MEDICINE USED")
            mileage -= 5
            inventory.misc -= 2
        } else {
            // 60, 90, or 97.5
            percent = 100.0 - (40.0 / pow(4.0, Double(eatingRate - minEatingRate)))
            if 100 * nextRandomFraction() < percent {
                print("BAD ILLNESS---MEDICINE USED")
                mileage -= 5
                inventory.misc -= 5
            } else {
                print("SERIOUS ILLNESS---")
                print("YOU MUST STOP FOR MEDICAL ATTENTION")
                inventory.misc -= 10
                isIll = true
            }
        }
        // 6440
        if inventory.misc < 0 {
            dieOfLackOfMedicalSupplies(injuries: isInjured)
        }
    }
    
    // 3540 ***SELECTION OF EVENTS***
    let eventRoll = 100 * nextRandomFraction()
    switch (eventRoll)
    {
    case 0..<6:
        // 3660
        print("WAGON BREAKS DOWN--LOSE TIME AND SUPPLIES FIXING IT")
        mileage -= 15 + 5 * nextRandomFraction()
        inventory.misc -= 8
    case 6..<11:
        // 3700
        print("OX INJURES LEG--SLOWS YOU DOWN REST OF TRIP")
        mileage -= 25
        inventory.animals -= 20
    case 11..<13:
        // 3740
        print("BAD LUCK---YOUR DAUGHTER BROKE HER ARM")
        print("YOU HAD TO STOP AND USE SUPPLIES TO MAKE A SLING")
        mileage -= 5 + 4 * nextRandomFraction()
        inventory.misc -= 2 + 3 * nextRandomFraction()
    case 13..<15:
        // 3790
        print("OX WANDERS OFF---SPEND TIME LOOKING FOR IT")
        mileage -= 17
    case 15..<17:
        // 3820
        print("YOUR SON GETS LOST---SPEND HALF THE DAY LOOKING FOR HIM")
        mileage -= 10
    case 17..<22:
        // 3850
        print("UNSAFE WATER--LOSE TIME LOOKING FOR CLEAN SPRING")
        mileage -= 10 * nextRandomFraction() + 2
    case 22..<32:
        // 3880
        if mileage <= southPassMileage {
            print("HEAVY RAINS---TIME AND SUPPLIES LOST")
            inventory.food -= 10
            inventory.bullets -= 500
            inventory.misc -= 15
            mileage -= 10 * nextRandomFraction() + 5
        } else {
            // 4490
            print("COLD WEATHER---BRRRRRRR!---YOU")
            var isUnderdressed = inventory.clothing <= 22 + 4 * nextRandomFraction()
            if isUnderdressed {
                print("DON'T")
            } // else 4530
            print("HAVE ENOUGH CLOTHING TO KEEP YOU WARM")
            if isUnderdressed {
                illness()
            }
        }
    case 32..<35:
        // 3960
        print("BANDITS ATTACK")
        var shotSpeed = shoot()
        inventory.bullets -= 20 * shotSpeed
        if inventory.bullets >= 0 && shotSpeed <= 1 {
            // 4100
            print("QUICKEST DRAW OUTSIDE OF DODGE CITY!!!")
            print("YOU GOT 'EM!")
        } else {
            if inventory.bullets < 0 {
                // 4000
                print("YOU RAN OUT OF BULLETS---THEY GET LOTS OF CASH")
                // 4010
                inventory.cash /= 3
            }
            print("YOU GOT SHOT IN THE LEG AND THEY TOOK ONE OF YOUR OXEN")
            isInjured = true
            print("BETTER HAVE A DOC LOOK AT YOUR WOUND")
            inventory.misc -= 5
            inventory.animals -= 20
        }
    case 35..<37:
        // 4130
        print("THERE WAS A FIRE IN YOUR WAGON—FOOD AND SUPPLIES DAMAGE!")
        inventory.food -= 40
        inventory.bullets -= 400
        inventory.misc -= nextRandomFraction() * 8 + 3
        mileage -= 15
    case 37..<42:
        // 4190
        print("LOSE YOUR WAY IN HEAVY FOG---TIME IS LOST")
        mileage -= 10 + 5 * nextRandomFraction()
    case 42..<44:
        // 4220
        print("YOU KILLED A POISONOUS SNAKE AFTER IT BIT YOU")
        inventory.bullets -= 10
        inventory.misc -= 5
        if inventory.misc < 0 {
            print("YOU DIE OF SNAKEBITE SINCE YOU HAVE NO MEDICINE")
            die()
        }
    case 44..<54:
        // 4290
        print("WAGON GETS SWAMPED FORDING RIVER--LOSE FOOD AND CLOTHES")
        inventory.food -= 30
        inventory.clothing -= 20
        mileage -= 20 + 20 * nextRandomFraction()
    case 54..<64:
        // 4340
        print("WILD ANIMALS ATTACK!")
        var shotSpeed = shoot()
        if inventory.bullets < 40 {
            print("YOU WERE TOO LOW ON BULLETS")
            print("THE WOLVES OVERPOWERED YOU")
            isInjured = true
            dieOfInjuriesOrPneumonia(injuries: true)
        }
        if shotSpeed <= 2 {
            print("NICE SHOOTIN' PARDNER---THEY DIDN'T GET MUCH")
        } else {
            print("SLOW ON THE DRAW---THEY GOT AT YOUR FOOD AND CLOTHES")
        }
        inventory.bullets -= 20 * shotSpeed
        inventory.clothing -= shotSpeed * 4
        inventory.food -= shotSpeed * 8
    case 64..<69:
        // 4560
        print("HAIL STORM---SUPPLIES DAMAGED")
        mileage -= 5 + nextRandomFraction() * 10
        inventory.bullets -= 200
        inventory.misc -= 4 + nextRandomFraction() * 3
    case 69..<95:
        // 4610
        switch eatingRate {
        case minEatingRate:
            illness()
        case minEatingRate + 1:
            if nextRandomFraction() > 0.25 {
                illness()
            }
        default:
            if nextRandomFraction() < 0.5 {
                illness()
            }
        }
    case 95..<100:
        // 4670
        print("HELPFUL INDIANS SHOW YOU WHERE TO FIND MORE FOOD")
        inventory.food += 14
    default:
        print("unexpected event: \(eventRoll)")
    }
    
    func blizzardInMountainPass() {
        // 4970
        print("BLIZZARD IN MOUNTAIN PASS--TIME AND SUPPLIES LOST")
        inventory.food -= 25
        inventory.misc -= 10
        inventory.bullets -= 300
        mileage -= 30 + 40 * nextRandomFraction()
        // 5030
        if inventory.clothing < 18 + 2 * nextRandomFraction() {
            illness()
        }
    }
    
    func checkForClearingPasses() {
        // 4900
        if mileage >= 1700 && !didClearBlueMountains {
            // 4920
            didClearBlueMountains = true
            // 4930
            if nextRandomFraction() < 0.7 {
                // 4970
                blizzardInMountainPass()
            }
        }
        // 4940
        if mileage <= southPassMileage {
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
    if mileage > southPassMileage {
        // 4720
        var square = pow(mileage / 100 - 15, 2.0)
        // At mileage==950, nextRandomFraction()*10 must be <= 6.58 for rugged mountains
        // At mileage==1200, rhs==5.14
        // At mileage==1500, square is 0, rhs==3
        // At mileage==1800, rhs==5.14
        // Distribution is V shaped trough with minimum at mileage==1500 and maximum of 8 for large mileage.
        // See "Occurrence of 'Rugged Mountains' as a function of mileage" in the paper.
        if nextRandomFraction() * 10 <= 9 - (square + 72)/(square + 12) {
            print("RUGGED MOUNTAINS")
            if nextRandomFraction() <= 0.1 {
                // 4750
                print("YOU GOT LOST---LOSE VALUABLE TIME TRYING TO FIND TRAIL!")
                mileage -= 60
            } else {
                // 4780
                if nextRandomFraction() <= 0.11 {
                    print("WAGON DAMAGED!---LOSE TIME AND SUPPLIES")
                    inventory.misc -= 5
                    inventory.bullets -= 200
                    mileage -= 20 + 30 * nextRandomFraction()
                } else {
                    // 4840
                    print("THE GOING GETS SLOW")
                    // 4850
                    mileage -= 45 + nextRandomFraction() / 0.02
                }
            }
            
        }
        // 4860
        clearSouthPass()
    }
    // 1230
    let oregonCityDistance = 2040.0
    if mileage >= oregonCityDistance {
        // 5420 ***FINAL TURN***
        // 5430
        // fraction of two weeks traveled on final turn (was "F9")
        let fraction = (oregonCityDistance - mileageThroughPreviousTurn) / (mileage - mileageThroughPreviousTurn)
        let inverse = 1 - fraction
        inventory.food += inverse * getFoodConsumption(eatingRate: eatingRate)
        print()
        // 5470
        print("YOU FINALLY ARRIVED AT OREGON CITY")
        print("AFTER 2040 LONG MILES---HOORAY!!!!!")
        print("A REAL PIONEER!")
        print()
        // 5510
        var daysInFinalTurn = int(fraction * 14)
        var day = turn * 14 + Int(daysInFinalTurn)
        daysInFinalTurn += 1
        if daysInFinalTurn >= 8 {
            daysInFinalTurn -= 7
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
        print("\(daysOfWeek[Int(daysInFinalTurn)]) ")
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
        inventory.resetNegativesAndFractions()
        inventory.cash = max(inventory.cash, 0)
        inventory.printSummary()
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
} // end of main turn loop
