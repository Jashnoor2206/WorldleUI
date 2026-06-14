//
//  Buttons.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 11/06/26.
//

import SwiftUI

struct Buttons: View {
    @Binding var selection: Int
    @Binding var attemptNumber: Int
    @Binding var SettingOpen: Bool
    @Binding var RuleOpen: Bool
    let numberOfletters: Double
    @Binding var game: Wordle
    
    var body: some View {
        HStack(spacing: 0){
            Button{ // restart button
                attemptNumber = 0
                selection = 0
                withAnimation(.default){
                    game.restart()
                }
            }label: { Text("Restart").font(.title) }
                .tint(.primary)
            
            Spacer()

            Button{ // guess button
                if  !game.guessCode.inside.contains(" ") && !game.isOver && attemptNumber <= 5 { // this line prevents guess button to only work when all letters are filled and game is not over and attempts are less than 5
                    
                    withAnimation(.default){
                        game.attemptGuess() // guess button will render but not work when game.isOver is true
                        attemptNumber = attemptNumber + 1
                        game.guessCode.inside = Array(repeating: " ", count: Int(numberOfletters))
                        selection = 0 // back to index 0
                    }
                    
                }
            }label: { Text("Guess").font(.title) }
                .tint(.primary)

            Spacer()
            
            Button{ // setting button
                SettingOpen = true
            }label: { Image(systemName: "gearshape").font(.title2) }
                .tint(.primary)

            Spacer()
            
            Button{ // Rules button
                RuleOpen = true
            }label: { Image(systemName: "questionmark.app").font(.title) }
                .tint(.primary)

        }
    }
}
