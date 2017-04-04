/**
  A simple RPG in swift
  rpgnator the requirements for this game are:
 - Author:
    David Schnepp
 - Important:
 The project requirements are:
    - 2 players are added
    - each player can choose from 3 classes: Fighter, Archer, Wizard
    - each class has it's own weapon with different damages
    - the game is played in trurns, each turn each player choose it's action: Attack or Enhance
    - if the player chose Attack, he removes his weapon's damage from the other player's health
    - if the player chose Enhance, 5 damage points are added to his weapon
    - the game end when one player's health reachs 0
*/

import Foundation

print("Welcome to \(Application.name) version \(Application.version)")

let game = RPG()
game.Start()

