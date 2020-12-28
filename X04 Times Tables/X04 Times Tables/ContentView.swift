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
    @State private var showTables = true
    @State private var showDifficulty = false
    @State private var selectedTable = 0
    @State private var selectedDifficulty = 0
    @State private var questions: [Int] = []
    @State private var answer: String = ""
    
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
            
            if self.selectedDifficulty > 0 {
                VStack {
                    self.ShowQuestions()
                }
            }
        }
    }
    
    func ShowQuestions() -> AnyView {
        
        DispatchQueue.main.async {
            self.questions = self.RandQuestions()
        }
        
        return AnyView (VStack {
            ForEach(questions.indices, id: \.self) { i in
                HStack {
                    Text("\(i) x \(self.questions[i])")
                    TextField("", text: self.$answer)
                }
            }
        })
    }
    
    func Difficulty() -> AnyView {
        
        return AnyView (VStack {
            ForEach(numOfQuestions, id: \.self) { row in
                Button(action: {
                    self.selectedDifficulty = row
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
    
    func RandQuestions() -> [Int] {
        var ret = [Int]()
        
        for i in 1...selectedDifficulty {
            ret.append(i * self.selectedTable)
        }
        
        return ret
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
