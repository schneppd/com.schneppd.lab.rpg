//
//  RPG.swift
//  rpgnator
//
//  Created by cdsm on 04/04/2017.
//  Copyright © 2017 com.schneppd.lab. All rights reserved.
//

import Foundation

class RPG {
    var players:[Character]
    
    init() {
        players = []
    }
    
    func SetupCharacter(indexCharacter:CShort) -> Character {
        var name:String = ""
        var type:CShort = 0
        
        var validInput:Bool = false
        while(!validInput){
            print("Player \(indexCharacter), input your name")
            let inputName:String? = readLine()!
            
            print("Player \(indexCharacter), input your class (1=Archer, 2=Fighter, 3=Wizard)")
            let inputClass:String? = readLine()!
            
            if(inputName != "" && inputClass != ""){
                name = inputName!
                let playerClass:CShort = CShort((inputClass! as NSString).intValue)
                if(playerClass > 0 && playerClass < 4){
                    type = playerClass
                    validInput = true
                }
            }
            else{
                print("Wrong input restart Player \(indexCharacter)!")
            }
            
        }
        
        let c = Character(cIdPlayer: indexCharacter, cName: name, cType: type)
        return c
    }
    
    func AddCharacterToGame() {
        let newIndex = CShort(players.count)
        let c = SetupCharacter(indexCharacter: newIndex)
        players.append(c)
    }
    
    func LetCharacterMeetEachOther() {
        players[0].SetOppenent(otherCharacter: players[1])
        players[1].SetOppenent(otherCharacter: players[0])
    }
    
    func Fight() {
        let player1 = players[0]
        let player2 = players[1]
        
        while(!player1.IsDead() && !player2.IsDead()) {
            AskAction(player:player1)
            if(!player2.IsDead()){
                AskAction(player:player2)
            }
        }
    }
    
    func AskAction(player:Character) {
        // describe player
        print("Player \(player.idPlayer)'s turn!")
        print("Name: \(player.name)")
        print("Life: \(player.life)")
        print("Weapon power: \(player.weapon.damage)")
        
        // ask action
        var validInput:Bool = false
        while(!validInput) {
            print("What do you want to do? (1 = Attack, 2 = Increase weapon power)")
            let inputAction:String? = readLine()!
            if (inputAction == "") {
                // error bad input
                continue
            }
            let playerAction = (inputAction! as NSString).intValue
            
            switch (playerAction) {
            case 1:
                player.Attack()
            case 2:
                player.ImproveWeapon()
            default:
                //error bad value
                continue
            }
            if(player.opponent!.IsDead()){
                print("The winner is \(player.name)")
            }
            
            validInput = true
            
        }
    }
    
    func Start() {
        print("Let the game begin!")
        
        AddCharacterToGame()
        AddCharacterToGame()
        
        LetCharacterMeetEachOther()
        
        Fight()
        
    }
}
