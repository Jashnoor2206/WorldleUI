//
//  SettingScreen.swift
//  WordBreaker(Variation of CodeBreaker)
//
//  Created by Jashnoor Singh on 10/06/26.
//

import SwiftUI

struct SettingScreen: View{
    @Binding var SettingOpen: Bool
    @Binding var numberOfletters: Double
    
    var body: some View{
        VStack(spacing: 30){
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.5))
                    .aspectRatio(7, contentMode: .fit)
                    .overlay{
                        HStack{
                            Text("Setting")
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                            Button{
                                SettingOpen = false
                            }label: {
                                Image(systemName: "xmark")
                                    .font(.title3)
                                    .bold()
                                
                            }.tint(.primary)
                        }.padding()
                    }
            }
            HStack {
                Text("How many alphabets you want ?")
                    .font(.title)
            }
            HStack{
                Slider(value: $numberOfletters, in: 3...6, step: 1)
                    .tint(.red) // change the color of the slider
            }
            HStack{
                Text("\(Int(numberOfletters)) Letters")
                    .font(.title2)
            }
        }.padding()
        Spacer()
    }
}
