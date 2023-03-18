//
//  ContentView.swift
//  DIcee SwiftUI
//
//  Created by Abdeljaouad Mezrari on 04/03/2023.
//  Copyright © 2023 Abdeljaouad Mezrari. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160)
                Spacer()
                HStack{
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                Spacer()
                Button(action: {
                    for counter in 1...5{
                        Timer.scheduledTimer(withTimeInterval: Double(counter) * 0.3, repeats: false) { Timer in
                            leftDiceNumber = Int.random(in: 1...6)
                            rightDiceNumber = Int.random(in: 1...6)
                        }
                    }
                    
                }) {
                    Text("Roll")
                        .foregroundColor(.white)
                        .accentColor(.white)
                        .font(.system(size: 20))
                        .padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 30))
                }
                .background(Color.red)
                
                
            .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 150)
    }
}
