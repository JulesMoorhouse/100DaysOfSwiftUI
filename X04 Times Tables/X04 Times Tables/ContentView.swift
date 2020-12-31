//
//  ContentView.swift
//  X04 Times Tables
//
//  Created by Julian Moorhouse on 26/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ScreenTitle: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.largeTitle)
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                .background(Color.yellow)
                .clipShape(Capsule())
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 30, trailing: 0))
    }
}

struct SecondaryTitle: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.headline)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
    }
}

struct CapsuleButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 100, minHeight: 44)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding(20)
        
    }
}

extension View {
    func ScreenTitleStyle() -> some View {
        self.modifier(ScreenTitle())
    }
    func SecondaryTitleStyle() -> some View {
        self.modifier(SecondaryTitle())
    }
    func CapsuleButtonStyle() -> some View {
        self.modifier(CapsuleButton())
    }
}

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
    @State private var yourAnswers: [String] = Array(repeating: "0", count: 12)
    
    let start: [Int] = [1,3,6, 10]
    let end: [Int] = [2,5,9, 12]
    
    let numOfQuestions: [Int] = [3,6,9,12]
    
    // ------ BODY ------
    var body: some View {
        ScrollView {
            if self.selectedTable == 0 {
                self.Table()
            }
            
            if self.selectedTable > 0 && self.selectedDifficulty == 0 {
                self.Difficulty()
            }
            
            if self.selectedDifficulty > 0 && !self.showResults {
                self.Question()
            }
            
            if self.showResults {
                self.Results()
            }
        }
    }
    
    // ------ Functions ------
    func Results() -> AnyView {
        
        return AnyView (
            VStack {
                Text("Results")
                    .ScreenTitleStyle()
                
                self.ResultData()
                
                Button(action: {
                    self.selectedTable = 0
                    self.selectedDifficulty = 0
                    self.showResults = false
                    self.yourAnswers = Array(repeating: "0", count: 12)
                }) {
                    Text("Again?")
                }
                .CapsuleButtonStyle()
            }
        )
    }
    
    func ResultData() -> AnyView {
        
        var score = 0
        var explanations = ""
        for i in 0 ..< correctAnswers.count {
            if self.correctAnswers[i] == Int(self.yourAnswers[i]) {
                score += 1
            } else {
                explanations += "\n\(self.correctAnswers[i] / self.selectedTable) x \(self.selectedTable) = \(self.correctAnswers[i]) \n"
            }
        }
        
        if explanations != "" {
            explanations = "Here's the correct answers for sums you got wrong :-\n" +
            explanations
        }
        
        return AnyView (
            VStack {
                VStack(alignment: .center) {
                    Text("You scored \(score) out of \(self.correctAnswers.count).")
                        .SecondaryTitleStyle()
                    
                    Text(explanations)
                        .multilineTextAlignment(.center)
                }
            }
        )
    }
    
    func Question() -> AnyView {
        
        return AnyView (
            VStack {
                Text("Test")
                    .ScreenTitleStyle()
                
                Text("Table: \(self.selectedTable) Difficulty: \(self.selectedDifficulty)")
                    .SecondaryTitleStyle()
                
                self.QuestionRows()
                
                Button(action: {
                    self.showResults = true
                }) {
                    Text("Done")
                }
                .CapsuleButtonStyle()
                
                
            }
        )
    }
    
    
    func QuestionRows() -> AnyView {
        
        return AnyView (
            VStack {
                ForEach(correctAnswers.indices, id: \.self) { i in
                    HStack {
                        Text("\(self.correctAnswers[i] / self.selectedTable) x \(self.selectedTable) = ")
                            .frame(width: 70)
                        TextField("0",
                                  text: self.$yourAnswers[i])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .frame(width: 50)
                    }
                }
            }
        )
    }
    
    func Difficulty() -> AnyView {
        
        return AnyView (
            VStack {
                Text("Difficulty")
                    .ScreenTitleStyle()
                
                ForEach(numOfQuestions, id: \.self) { row in
                    Button(action: {
                        self.selectedDifficulty = row
                        self.correctAnswers = self.RandAnswers()
                    }) {
                        Text("\(row)")
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                    }
                    .CapsuleButtonStyle()
                }
            }
        )
    }
    
    func Table() -> AnyView {
        
        return AnyView (
            VStack {
                Text("Times Tables")
                    .ScreenTitleStyle()
                
                Text("Select a table")
                    .SecondaryTitleStyle()
                
                ForEach(0 ..< start.count) { inc in
                    self.TableButton(inc: inc)
                }
            }
        )
    }
    
    func TableButton(inc: Int) -> AnyView {
        
        return AnyView (
            HStack {
                ForEach(self.start[inc] ..< (self.end[inc]+1)) { row in
                    Button(action: {
                        self.selectedTable = row
                    }) {
                        Text("\(row)")
                            .frame(width: 18)
                    }
                    .padding(20)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                }
            }
        )
    }
    
    func RandAnswers() -> [Int] {
        var ret = [Int]()
        
        while ret.count != selectedDifficulty {
            let line = Int.random(in: 1...12)
            let answer = line * self.selectedTable
            if (!ret.contains(answer)) {
                ret.append(answer)
            }
        }
        
        ret.sort()
        return ret
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
