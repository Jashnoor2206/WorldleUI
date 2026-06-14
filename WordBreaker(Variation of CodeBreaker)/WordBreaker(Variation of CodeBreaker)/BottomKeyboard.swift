//
//  BottomKeyboard.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 08/06/26.
//

import SwiftUI

struct BottomKeyboard: View {
    @Binding var game: Wordle
    @Binding var selection: Int
    let keyboardColors: [Character: Match]
    let alphabetsFirstRow: String = "QWERTYU" // full qwerty for options below
    let alphabetsSecondRow: String = "IOPASDF"
    let alphabetsThirdRow: String = "GHJKLZX"
    let alphabetsFourthRow: String = "CVBNM"
    
    var body: some View {
        
        HStack{ board(alphabetsFirstRow) } // first row
        HStack{ board(alphabetsSecondRow) } // second row
        HStack{ board(alphabetsThirdRow) } // third row 
        HStack{ // fourth row
            board(alphabetsFourthRow)
            
            Button{
                game.guessCode.inside[selection] = " "
                if selection == 0{
                    selection = game.masterCode.inside.count - 1
                } else{ selection = selection - 1 }
                
            }label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.clear)
                    .strokeBorder(.primary)
                    .frame(width: 90, height: 60)
                    .overlay{
                        Image(systemName: "delete.left")
                            .font(.title2)
                    }
            }.tint(.primary)
        }
    }
    
    func board(_ string: String) -> some View { // always define function outside the body
        ForEach(Array(string), id: \.self){ character in
            Button{
                game.setGuessLetter(set: character, index: selection)
                selection = (selection + 1) % game.masterCode.inside.count
            }label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        keyboardColors[character] == .exact ? .green :
                        keyboardColors[character] == .inexact ? .yellow :
                        keyboardColors[character] == .nomatch ? .gray :
                        .clear)
                    .strokeBorder(.primary)
                    .aspectRatio(0.75, contentMode: .fit)
                    .overlay{
                        Text(String(character))
                    }
            }
            .tint(.primary)
        }
    }
}
