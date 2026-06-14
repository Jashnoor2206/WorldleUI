//
//  RulesScreen.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 10/06/26.
//

import SwiftUI

struct RulesScreen: View{
    @Binding var isPresented: Bool
    var body: some View{
        ScrollView{
            VStack(spacing: 30){
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.5))
                        .aspectRatio(7, contentMode: .fit)
                        .overlay{
                            HStack{
                                Text("How to Play ?")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                                Button{
                                    isPresented = false
                                }label: {
                                    Image(systemName: "xmark")
                                        .font(.title3)
                                        .bold()
                                        
                                }.tint(.primary)
                            }.padding()
                        }
                }
                
                HStack{
                    Text("Wordle is a word-guessing game where players try to guess a hidden word within six attempts. The game provides feedback for each guess to help players find the correct word.")
                        .font(.title2)
                }
                
            }.padding()
            
            VStack(spacing: 10){
                HStack{
                    Text("Wordle Rules : ")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                HStack{
                    Text("Each guess must be a valid five-letter word. After submitting a guess, the game provides color-coded feedback : ")
                        .font(.title2)
                }
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 50, height: 50)
                    
                    Text("Green: Letter is at correct position and correct letter.")
                        .font(.title3)
                    Spacer()
                }
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow)
                        .frame(width: 50, height: 50)
                    Text("Yellow: Letter is at correct but at wrong position.")
                        .font(.title3)
                    Spacer()
                    
                }
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray)
                        .frame(width: 50, height: 50)
                    Text("Letter is not correct.")
                        .font(.title3)
                    Spacer()
                }
                HStack{
                    Text("Players must use the feedback to refine their guesses and discover the hidden word. The goal is to guess the word within six attempts.")
                        .font(.title2)
                }
                HStack{
                    Text("Have fun and challenge yourself to find the word as quickly as possible!")
                        .font(.title2)
                }
            }.padding()
            Spacer()
        }
    }
}

//#Preview {
//    RulesScreen(isPresented: true)
//}
