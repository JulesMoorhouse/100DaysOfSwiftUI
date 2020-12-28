//
//  ContentView.swift
//  X04 Times Tables
//
//  Created by Julian Moorhouse on 26/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct RandomQuestions {
    var table: Int
    var amount: Int
    
    func Randomize() -> [Int] {
        var ret = [Int]()
        
        for i in 1...amount {
            ret.append(i * table)
        }
        
        return ret
    }
}

struct ContentView: View {
    @State private var selectedTable = 0
    @State private var selectedDifficulty = 0
    @State private var showResults = false
    @State private var correctAnswers: [Int] = []
    @State private var yourAnswers: [String] = Array(repeating: "0", count: 11)
    
    let start: [Int] = [1,5,10]
    let end: [Int] = [4,9,12]
    
    let numOfQuestions: [Int] = [3,6,9,12]
    
    var body: some View {
        VStack {
            if self.selectedTable == 0 {
                Text("Select a table")
                ForEach(0 ..< start.count) { inc in
                    self.Tables(inc: inc)
                }
            }
            
            if self.selectedTable > 0 && self.selectedDifficulty == 0 {
                Text("Select difficulty")
                self.Difficulty()
            }
            
            if self.selectedDifficulty > 0 && !self.showResults {
                VStack {
                    Text("Table: \(self.selectedTable) Difficulty: \(self.selectedDifficulty)")
                    self.ShowQuestions()
                    Button(action: {
                        self.showResults = true
                    }) {
                        Text("Done")
                    }
                }
            }
            
            if self.showResults {
                self.Results()
                Button(action: {
                    self.selectedTable = 0
                    self.selectedDifficulty = 0
                    self.showResults = false
                    self.yourAnswers = Array(repeating: "0", count: 11)
                }) {
                    Text("Again?")
                }
            }
        }
    }
    
    func Results() -> AnyView {
        
        var score = 0
        
        for i in 0 ..< correctAnswers.count {
            if self.correctAnswers[i] == Int(self.yourAnswers[i]) {
                score += 1
            }
        }
        
        return AnyView (VStack {
            Text("You scored \(score) out of \(self.correctAnswers.count).")
        })
    }
    
    func ShowQuestions() -> AnyView {
        
        return AnyView (VStack {
            ForEach(correctAnswers.indices, id: \.self) { i in
                HStack {
                    Text("\(self.correctAnswers[i] / self.selectedTable) x \(self.selectedTable) = ")
                        .frame(width: 70)
                    TextField("0",
                              text: self.$yourAnswers[i])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 50)
                }
            }
        })
    }
    
    func Difficulty() -> AnyView {
        
        return AnyView (VStack {
            ForEach(numOfQuestions, id: \.self) { row in
                Button(action: {
                    self.selectedDifficulty = row
                    self.correctAnswers = self.RandAnswers()
                }) {
                    Text("\(row)")
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                .background(Color.gray)
                .foregroundColor(.white)
                .padding(20)
            }
        })
    }
    
    func Tables(inc: Int) -> AnyView {
        return AnyView (HStack {
            ForEach(self.start[inc] ..< (self.end[inc]+1)) { row in
                Button(action: {
                    self.selectedTable = row
                }) {
                    Text("\(row)")
                }
                .padding(20)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
        })
    }
    
    func RandAnswers() -> [Int] {
        var ret = [Int]()
        
        for _ in 1...selectedDifficulty {
            let line = Int.random(in: 1...12)
            ret.append(line * self.selectedTable)
        }
        
        return ret
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
