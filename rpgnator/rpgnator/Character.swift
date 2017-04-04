//
//  Character.swift
//  rpgnator
//
//  Created by cdsm on 04/04/2017.
//  Copyright © 2017 com.schneppd.lab. All rights reserved.
//

import Foundation

enum CharacterType: CShort {
    case Archer = 1, Fighter = 2, Wizard = 3
}

class Character {
    var name:String
    var type:CharacterType
    var weapon:Weapon
    var life:Int = 100
    var opponent:Character? = nil
    var idPlayer:CShort
    
    init(cIdPlayer:CShort, cName:String, cType:CShort) {
        idPlayer = cIdPlayer
        name = cName
        
        type = CharacterType(rawValue: cType)!
        switch(type){
        case CharacterType.Archer:
            weapon = Bow()
        case CharacterType.Fighter:
            weapon = Sword()
        case CharacterType.Wizard:
            weapon = Staff()
        }
    }
    
    func SetOppenent(otherCharacter:Character) {
        opponent = otherCharacter
    }
    
    func Attack() {
        opponent!.life -= weapon.damage
    }
    
    func ImproveWeapon() {
        weapon.damage += 5
    }
    
    func IsDead() -> Bool {
        return !(life >= 0)
    }
}
