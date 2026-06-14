//
//  SecondScreen.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 08/06/26.
//

import SwiftUI

struct DefaultScreen: View {
    @Namespace private var selectionNamespace
    var typeof : Code // accepting a binding type variable
    @Binding var selection: Int
    let numberOfletters: Int
    let letters: [Character]
    
    init(typeof: Code, selection: Binding<Int> = .constant(-1), numberOfletters: Int, letters: [Character]){
        self.typeof = typeof
        self._selection = selection
        self.numberOfletters = numberOfletters
        self.letters = letters
    }
    
    var body: some View {
            HStack{
                ForEach(0..<Int(numberOfletters), id: \.self){ index in
                    Rectangle()
                        .fill(.clear)
                        .aspectRatio(1, contentMode: .fit)
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .background{
                            Group{
                                if typeof.kind == .guess, selection == index{
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.3))
                                        .matchedGeometryEffect(id: "selection", in: selectionNamespace)
                                }}.animation(.default, value: selection)
                            if let match = typeof.matches{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(match[index] == .exact ? .green : match[index] == .inexact ? .yellow : .gray)
                            }
                        }
                        .overlay{
                            if !typeof.inside.isEmpty{ // basically if there are words present then it will only overlay
                                Text(String(letters[index]))
                                    .font(.title)
                            }
                        }
                        .onTapGesture {
                            if typeof.kind == .guess{
                                selection = index
                            }
                        }
                }
        }
    }
}

