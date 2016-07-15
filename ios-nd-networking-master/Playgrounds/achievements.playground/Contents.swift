//
//  achievements.playground
//  iOS Networking
//
//  Created by Jarrod Parkes on 09/30/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

/* Path for JSON files bundled with the Playground */
var pathForAchievementsJSON = NSBundle.mainBundle().pathForResource("achievements", ofType: "json")

/* Raw JSON data (...simliar to the format you might receive from the network) */
var rawAchievementsJSON = NSData(contentsOfFile: pathForAchievementsJSON!)

/* Error object */
var parsingAchivementsError: NSError? = nil

/* Parse the data into usable form */
var parsedAchievementsJSON = try! NSJSONSerialization.JSONObjectWithData(rawAchievementsJSON!, options: .AllowFragments) as! NSDictionary

func parseJSONAsDictionary(dictionary: NSDictionary) {
    /* Start playing with JSON here... */
    // get the top level dictionaries for achievements and categories
    guard let achievementDictionaries = parsedAchievementsJSON["achievements"] as? [NSDictionary] else {
        print("Cannot find key 'achievements' in \(parsedAchievementsJSON)")
        return
    }
    
    guard let categoryDictionaries = parsedAchievementsJSON["categories"] as? [NSDictionary] else {
        print("Cannot find 'categories' in \(parsedAchievementsJSON)")
        return
    }
    
    var pointsTotal = 0
    
    // create an array to hold the categoryIds for "matchmaking" categories
    var matchMakingIds: [Int] = []
    
    // create dictionary to store the counts for "matchmaking" categories
    var categoryCounts: [Int: Int] = [:]
    
    // store all matchmaking categories
    for categoryDictionary in categoryDictionaries {
        
        if let title = categoryDictionary["title"] as? String where title == "Matchmaking" {
            guard let children = categoryDictionary["children"] as? [NSDictionary] else {
                print("Cannot find key 'children' in \(categoryDictionary)")
                return
            }
            
            for child in children {
                guard let categoryID = child["categoryID"] as? Int else {
                    print("Cannot find key 'categoryID' in \(child)")
                    return
                }
                
                matchMakingIds.append(categoryID)
            }
        }
    }
    
    for achievementDictionary in achievementDictionaries {
        // add to point total and print if achievement has greater than 10 points
        guard let points = achievementDictionary["points"] as? Int else {
            print("Cannot find key 'points' in \(achievementDictionary)")
            return
        }
        
        pointsTotal += points
        
        // how many achievements have a point value greater than 10?
        if points > 10 {
            print("achievement has a point value greater than 10")
        }
    }
    
    
    
}

parseJSONAsDictionary(parsedAchievementsJSON)
