//
//  ContentView.swift
//  P07A iExpense
//
//  Created by Julian Moorhouse on 12/02/2021.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        Text("Hello \(name)")
            .padding(20)
        
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            // show the sheet
            self.showingSheet.toggle()
        }
        .sheet(isPresented:  $showingSheet) {
            // contents of the sheet
            SecondView(name: "@twostraws")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
