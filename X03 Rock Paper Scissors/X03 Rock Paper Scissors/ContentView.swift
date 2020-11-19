//
//  ContentView.swift
//  X03 Rock Paper Scissors
//
//  Created by Julian Moorhouse on 19/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var items = ["Rock", "Paper", "Scissors"]
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var intCurrentChoice = 0
    @State private var boolShouldWinChoice = false
    @State private var boolShouldWin = Bool.random()
    @State private var userScore = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Your score is \(userScore)")
                .font(.largeTitle)
            Text("App plays the move:- \(items[appMove])")
            Text("Chose a move to \(boolShouldWin ? "Win" : "Fail")")
            Text("Pick your move")
            HStack {
                ForEach(0 ..< items.count) { idx in
                    Button(action: {
                        self.itemTapped(idx)
                    }) {
                        Text(self.items[idx])
                    }
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                }
            }
        }
    }
    
    func itemTapped(_ number: Int) {
        
        let currentChoice = items[number]
        
        if currentChoice == self.items[2] && self.boolShouldWin || currentChoice == self.items[1] && !self.boolShouldWin {
            self.userScore += 1
        } else if currentChoice == self.items[0] && self.boolShouldWin || currentChoice == self.items[0] && !self.boolShouldWin {
            self.userScore += 0
        } else {
            self.userScore -= 1
        }
        
        boolShouldWin = Bool.random()
        appMove = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
