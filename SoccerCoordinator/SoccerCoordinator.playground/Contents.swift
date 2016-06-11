import  UIKit

////////////////////
/////Players///////
///////////////////

var joeSmith = ["name": "Joe Smith", "height": 42, "isExperienced": true, "guardians": "Jim and Jan Smith"]

var jillTanner = ["name": "Jill Tanner", "height": 36, "isExperienced": true, "guardians": "Clara Tanner"]

var billBon = ["name":"Bill Bon", "height": 43, "isExperienced": true, "guardians":"Sara and Jenny Bon"]

var evaGordon = ["name": "Eva Gordon", "height": 45, "isExperienced": false, "guardians": "Wendy and Mike Gordon"]

var mattGill = ["name": "Matt Gill", "height": 40, "isExperienced": false, "guardians": "Charles and Sylvia Gill"]

var kimmyStein = ["name": "Kimmy Stein", "height": 41, "isExperienced": false, "guardians": "Bill and Hillary Stein"]

var sammyAdams = ["name": "Sammy Adams", "height": 45, "isExperienced": false, "guardians": "Jeff Adams"]

var karlSaygan = ["name": "Karl Saygan", "height": 42, "isExperienced": true, "guardians": "Heather Bledsoe"]

var suzanneGreenberg = ["name": "Suzanne Greenberg", "height": 44, "isExperienced": true, "guardians": "Henrietta Dumas"]

var salDali = ["name": "Sal Dali", "height": 41, "isExperienced": false, "guardians": "Gala Dali"]

var joeKavalier = ["name": "Joe Kavalier", "height": 39, "isExperienced": false, "guardians": "Sam and Elaine Kavalier"]

var benFinkelstein = ["name": "Ben Finkelstein", "height": 44, "isExperienced": false, "guardians": "Aaron and Jill Finkelstein"]

var diegoSoto = ["name": "Diego Soto", "height": 41, "isExperienced": true, "guardians": "Robin and Sarika Soto"]

var chloeAlaska = ["name": "Chloe Alaska", "height": 47, "isExperienced": false, "guardians": "David and Jamie Alaska"]

var arnoldWillis = ["name": "Arnold Willis", "height": 43, "isExperienced": false, "guardians": "Claire Willis"]

var phillipHelm = ["name": "Phillip Helm", "height": 44, "isExperienced": true, "guardians": "Thomas Helm and Eva Jones"]

var lesClay = ["name": "Les Clay", "height": 42, "isExperienced": true, "guardians": "Wynona Brown"]

var herschelKrustofski = ["name": "Herschel Krustofski", "height": 45, "isExperienced": true, "guardians": "Hyman and Rachel Krustofski"]


//array of players
var allPlayers = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzanneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]


////////////////////
///////Teams///////
///////////////////

var sharks = [Dictionary<String, NSObject>]()
var dragons = [Dictionary<String, NSObject>]()
var raptors = [Dictionary<String, NSObject>]()

//array of teams
var allTeams = [sharks, dragons, raptors]


////////////////////
///Player Lists////
///////////////////

//rookie player lists
var avgRookieList = [[String: NSObject]]()
var tallRookieList = [[String: NSObject]]()
var shortRookieList = [[String: NSObject]]()

//veteran player lists
var avgVetList = [[String: NSObject]]()
var tallVetList = [[String: NSObject]]()
var shortVetList = [[String: NSObject]]()

//no. players per team
var avgPlayersPerTeam = allPlayers.count/allTeams.count

////////////////////
////Player Draft////
///////////////////

//evaluate players based on experience AND height
func playerEval() {
    for player in allPlayers {
        if (player["isExperienced"] == false) && ((player["height"] as! Int ) <= 40) {
            shortRookieList.append(player)
        }
        else if (player["isExperienced"] == false) && ((player["height"] as! Int ) >= 41) && ((player["height"] as! Int ) <= 44) {
            avgRookieList.append(player)
        }
        else if player["isExperienced"] == false && ((player["height"] as! Int ) >= 45) && ((player["height"] as! Int ) <= 47) {
            tallRookieList.append(player)
        }
        else if player["isExperienced"] == true && ((player["height"] as! Int ) <= 40) {
            shortVetList.append(player)
        }
        else if player["isExperienced"] == true && ((player["height"] as! Int ) >= 41) && ((player["height"] as! Int ) <= 44) {
            avgVetList.append(player)
        }
        else if player["isExperienced"] == true && ((player["height"] as! Int ) >= 45) && ((player["height"] as! Int ) <= 47) {
            tallVetList.append(player)
        }
    }
}

playerEval()

//array of rookie players
let allRookies = avgRookieList + tallRookieList + shortRookieList

//array of veteran players
let allVets = shortVetList + tallVetList + avgVetList

//draft players
func playerDraft() {
    //assign rookies to teams
    for player in allRookies {
        if sharks.count < (allRookies.count / allTeams.count) {
            sharks.append(player)
        } else if dragons.count < (allRookies.count / allTeams.count) {
            dragons.append(player)
        } else if raptors.count < (allRookies.count / allTeams.count) {
            raptors.append(player)
        }
    }
    
    //assign veterans to teams
    for player in allVets {
        if dragons.count < avgPlayersPerTeam {
            dragons.append(player)
        } else if sharks.count < avgPlayersPerTeam {
            sharks.append(player)
        } else if raptors.count < avgPlayersPerTeam {
            raptors.append(player)
        }
    }
}

//send letters to parents
func parentLetters() {
    print("Welcome to the Sharks!\n")
    for player in sharks {
        print("Dear \(player["guardians"]!), We would like to welcome you and \(player["name"]!) to the Sharks family! We will have our first official practice on March 17 at 3pm at the local soccer complex. We look forward to seeing you there! -Coach")
    }
    
    print("Welcome to the Dragons!\n")
    for player in dragons {
        print("Dear \(player["guardians"]!), We would like to welcome you and \(player["name"]!) to the Dragons family! We will have our first official practice on March 17 at 1pm at the local soccer complex. We look forward to seeing you there! -Coach")
    }
    
    print("Welcome to the Raptors!\n")
    for player in raptors {
        print("Dear \(player["guardians"]!), We would like to welcome you and \(player["name"]!) to the Raptors family! We will have our first official practice on March 18 at 1pm at the local soccer complex. We look forward to seeing you there! -Coach")
    }
}

playerDraft()
parentLetters()

print("***SHARKS*** \n \(sharks) \n")
print("***DRAGONS*** \n \(dragons) \n")
print("***RAPTORS*** \n \(raptors) \n")



