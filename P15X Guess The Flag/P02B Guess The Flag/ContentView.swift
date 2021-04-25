//
//  ContentView.swift
//  P02B Guess The Flag
//
//  Created by Julian Moorhouse on 16/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var flagName: String
    var body: some View {
        Image(flagName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule()
            .stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var message = ""
    @State private var correctTapped = false
    @State private var wrongTapped = false
    @State private var opacity = 1.0
    @State private var scaleAmount: CGFloat = 1

    var body: some View {
        ZStack {
            //Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30 ) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        // flag was tapped
                        self.flagTapped(number)
                    }) {
                        FlagImage(flagName: self.countries[number])
                    }
                    .opacity(self.correctTapped && self.correctAnswer != number ? 1.0 : self.opacity)
                    .rotation3DEffect(.degrees(self.correctTapped && self.correctAnswer == number ? 360 : 0), axis:  (x: 0, y: 1, z: 0))
                    .scaleEffect(self.wrongTapped && self.correctAnswer == number ? 1.0 : self.scaleAmount)

                }
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(message), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int) {
        withAnimation(.linear(duration: 3)) {
            if number == correctAnswer {
                scoreTitle = "Correct"
                userScore += 1
                message = "Your score is \(userScore)"
                self.correctTapped = true
                self.opacity -= 0.2
                
                
            } else {
                scoreTitle = "Wrong"
                message = ("Thats the flag of \(countries[number]).")
                self.wrongTapped = true
                self.scaleAmount += 1
            }
        }
        
        showingScore = true
        self.correctTapped = false
        self.wrongTapped = false
        self.opacity = 1.0
        self.scaleAmount = 1.0
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
