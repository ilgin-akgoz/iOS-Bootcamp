//
//  main.swift
//  Project 01 - Rock Paper Scissors
//
//  Created by Ilgın Akgöz on 19.06.2023.
//

import Foundation

enum Move: String {
    case rock
    case paper
    case scissors
}

let possibleMoves: [Move] = [.rock, .paper, .scissors]

let computerMove = possibleMoves.randomElement()!

print("Computer's move is \(computerMove.rawValue). Enter your move: ")

if let userInput = readLine()?.lowercased(), let userMove = Move(rawValue: userInput) {
    let result = findWhoWon(computerMove, userMove)
    print(result)
} else {
    print("You didn't enter a valid input. Try again.")
}

func findWhoWon(_ computer: Move, _ user: Move) -> String {
    switch (computer, user) {
    case _ where computer == user:
        return "It's a tie."
    case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
        return "You won!"
    default:
        return "I won!"
    }
}
