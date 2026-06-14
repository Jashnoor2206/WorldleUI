//
//  ContentView.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 05/06/26.
// We are making the wordle game UI

import SwiftUI

struct WordleMainView: View {
    // MARK: Variables owned by me
    @Environment(\.words) var words // now we can use all the methods of words
    @State var attemptNumber: Int = 0
    @State var numberOfletters: Double = 4
    @State var SettingOpen: Bool = false
    @State var RuleOpen: Bool = false 
    @State var selection: Int = 0
    @State var game = Wordle(4, Words.shared) // giving a temporary default value
    
    // MARK: - Body starts from here
    
    var body: some View {
        
        VStack{ // we are not passing selection in case of mastercode and attempts as init will handle it on its own
            
            var keyboardColors: [Character: Match] {
                var result = [Character: Match]()
                
                for attempt in game.attemptCode {
                    guard let matches = attempt.matches else { continue }
                    for (char, match) in zip(attempt.inside, matches) {
                        switch (result[char], match) {
                        case (nil, _):
                            result[char] = match          // first time seeing this letter
                        case (.exact, _):
                            break                          // already green, never downgrade
                        case (.inexact, .exact):
                            result[char] = .exact          // upgrade yellow to green
                        case (.nomatch, .exact), (.nomatch, .inexact):
                            result[char] = match           // upgrade gray
                        default:
                            break
                        }
                    }
                }
                return result
            }
            
            Buttons(selection: $selection,
                    attemptNumber: $attemptNumber,
                    SettingOpen: $SettingOpen,
                    RuleOpen: $RuleOpen,
                    numberOfletters: numberOfletters,
                    game: $game)
            
            ScrollView{
                ForEach(game.attemptCode.indices, id: \.self){index in
                    DefaultScreen( // for the attempts
                        typeof: game.attemptCode[index],
                        numberOfletters: game.attemptCode[index].inside.count,
                        letters: game.attemptCode[index].inside)
                }
                if !game.isOver{
                    if attemptNumber < 5{
                        DefaultScreen( // for the guess code
                            typeof: game.guessCode,
                            selection: $selection,
                            numberOfletters: game.guessCode.inside.count,
                            letters: game.guessCode.inside)
                    }
                    else{ Text("Attempts Exhausted !").font(.title) }
                }
                else{ Text("You Won !").font(.title) } }
            
            if !game.isOver && attemptNumber < 5{
                BottomKeyboard(
                    game: $game,
                    selection: $selection,
                    keyboardColors: keyboardColors)
                .transition(.bottomKeyboardTransition)
            }
            else{ EmptyView() } }
         .sheet(isPresented: $SettingOpen) { // allows to open a temporary screen which is settingScreen in our case when gear icon is tapped
            SettingScreen(SettingOpen: $SettingOpen, numberOfletters: $numberOfletters) }
         .sheet(isPresented: $RuleOpen){
            RulesScreen(isPresented: $RuleOpen) }
         .task {
             while !words.isLoaded {
                 try? await Task.sleep(for: .milliseconds(100))
             }
             // Re-init the game now that real words are available
             game = Wordle(Int(numberOfletters), words)
             attemptNumber = 0
             selection = 0
         }
         .onChange(of: numberOfletters){ _, newvalue in
             guard words.isLoaded else { return }
             game = Wordle(Int(newvalue), words)
             attemptNumber = 0
             selection = 0
         } // in place of _ actually it was oldvalue paramter since we dont care about it so we use _
         .padding()
    }
}

extension AnyTransition{
    static let bottomKeyboardTransition: AnyTransition = offset(x : 0, y : 400)
}

#Preview {
    WordleMainView()
}
