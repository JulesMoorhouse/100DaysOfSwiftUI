//
//  ContentView.swift
//  X04 Times Tables
//
//  Created by Julian Moorhouse on 26/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showTables = true
    @State private var showDifficulty = false
    @State private var selectedTable = 0
    @State private var selectedDifficulty = 0

    let start = [1,5,10]
    let end = [4,9,12]

    let questions = [3,6,9,12]
    
    var body: some View {
        VStack {
            if self.selectedTable == 0 {
                ForEach(0 ..< start.count) { inc in
                    self.Tables(inc: inc)
                }
            }
            
            if self.selectedTable > 0 {
                Text("Difficulty")
                self.Difficulty()
            }
            
            if self.selectedDifficulty > 0 {
                Text("Next")
            }
        }
    }

    
    func Difficulty() -> AnyView {
        return AnyView (VStack {
            ForEach(0 ..< 4) { row in
                Button(action: {
                    self.selectedDifficulty = row //self.questions[$0]
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
