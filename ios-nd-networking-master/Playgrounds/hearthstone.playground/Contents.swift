//
//  hearthstone.playground
//  iOS Networking
//
//  Created by Jarrod Parkes on 09/30/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

/* Path for JSON files bundled with the Playground */
var pathForHearthstoneJSON = NSBundle.mainBundle().pathForResource("hearthstone", ofType: "json")

/* Raw JSON data (...simliar to the format you might receive from the network) */
var rawHearthstoneJSON = NSData(contentsOfFile: pathForHearthstoneJSON!)

/* Error object */
var parsingHearthstoneError: NSError? = nil

/* Parse the data into usable form */
var parsedHearthstoneJSON = try! NSJSONSerialization.JSONObjectWithData(rawHearthstoneJSON!, options: .AllowFragments) as! NSDictionary

func parseJSONAsDictionary(dictionary: NSDictionary) {
    /* Start playing with JSON here... */
    var numCostRatioItems = 0
    var sumCostRatio: Double = 0.0
    
    var numCostForRarityItemsDictionary = [String: Int]()
    var sumCostForRarityDictionary = [String: Int]()
    
    // make an array of key values to be used by the dictionary
    let rarities = ["Free", "Common"]
    
    // loop through the keys and intialize those values to zero
    for rarity in rarities {
        numCostForRarityItemsDictionary[rarity] = 0
        sumCostForRarityDictionary[rarity] = 0
    }
    
    guard let arrayOfBasicSetCardDictionaries = parsedHearthstoneJSON["Basic"] as? [[String: AnyObject]] else {
        print("Cannot find key 'Basic' in \(parsedHearthstoneJSON)")
        return
    }
    
    for cardDictionary in arrayOfBasicSetCardDictionaries {
        
        guard let cardType = cardDictionary["type"] as? String else {
            print("Cannot find key 'type' in \(cardDictionary)")
            return
        }
        
        // looking at the Minion card
        if cardType == "Minion" {
            guard let attack = cardDictionary["attack"] as? Int else {
                print("Cannot find key 'attack' in \(cardDictionary)")
                return
            }
            
            guard let manaCost = cardDictionary["cost"] as? Int else {
                print("Cannot find key 'cost' in \(cardDictionary)")
                return
            }
            
            // How manyu minions have a cost of 5?
            if manaCost == 5 {
                print("Found a minion with cost 5")
            }
            
            // calculate stats to cost ratio if non zero cost
            if manaCost != 0 {
                numCostRatioItems += 1
                
                guard let health = cardDictionary["health"] as? Int else {
                    print("Cannot find key 'health' in \(cardDictionary)")
                    return
                }
                
                sumCostRatio += (Double(attack) + Double(health)) / Double(manaCost)
            }
            
            // get card cost based on rarity
            guard let rarityForCard = cardDictionary["rarity"] as? String else {
                print("Cannot find key 'rarity' in \(cardDictionary)")
                return
            }
            
            numCostForRarityItemsDictionary[rarityForCard]! += 1
            sumCostForRarityDictionary[rarityForCard]! += manaCost
            
            // how many minions have a battlecry effect mentioned in their text?
            if let cardText = cardDictionary["text"] as? String where cardText.rangeOfString("Battlecry") != nil {
                print("This minion has battlecry effect")
            }
            
            if cardType == "Weapon" {
                // how many weapons have a durability of 2
                if let durability = cardDictionary["durability"] as? Int where durability == 2 {
                    print("found a weapon with durability of 2")
                }
            }
        }
    }
    // calculate the average stats to cost ratio
    print("\(sumCostRatio / Double(numCostRatioItems))")
    
    // calculate the average cost of minions based on rarity
    for rarity in rarities {
        print("\(rarity): \(Double(sumCostForRarityDictionary[rarity]!) / Double(numCostForRarityItemsDictionary[rarity]!))")
    }

}

parseJSONAsDictionary(parsedHearthstoneJSON)
