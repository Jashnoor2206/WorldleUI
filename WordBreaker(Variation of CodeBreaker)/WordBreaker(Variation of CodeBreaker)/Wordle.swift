//
//  WordBreaker.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 08/06/26.
//

import SwiftUI

struct Wordle{
    
    var masterCode : Code
    var guessCode : Code
    var attemptCode: [Code] = [] // this will store our attempts
    
    init(_ numberOfLetters: Int, _ words: Words) {
        let secretWord = words.random(length: numberOfLetters) ?? "FAIL"
        masterCode = Code(
            kind: .mastercode(isHidden: true),
            inside: Array(secretWord)
        )
        guessCode = Code(
            kind: .guess,
            inside: Array(repeating: " ", count: numberOfLetters)
        )
        print(masterCode.inside)
    }
    
    var isOver: Bool{
        masterCode.inside == attemptCode.last?.inside
    }
    
    mutating func setGuessLetter(set: Character, index: Int){
        // guard allows us to stay within the bounds of the index
        guard index >= 0 && index < guessCode.inside.count else { return }
        guessCode.inside[index] = set
    }
    
    mutating func attemptGuess(){
        var attempt = guessCode // using this it only checks for the guesscode
        attempt.kind = .attempt(guessCode.match(against: masterCode))
        attemptCode.append(attempt)
        if isOver{
            masterCode.kind = .mastercode(isHidden: false)
        }
    }
    
    mutating func restart(){
        let word = Words.shared.random(length: masterCode.inside.count) ?? "FAIL"
        self.masterCode.inside = Array(word)
        self.masterCode.kind = .mastercode(isHidden: true)
        self.guessCode.inside = Array(repeating: " ", count: masterCode.inside.count)
        self.attemptCode.removeAll()
        print(masterCode.inside)
    }
}
