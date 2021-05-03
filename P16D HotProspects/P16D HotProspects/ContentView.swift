//
//  ContentView.swift
//  P16D HotProspects
//
//  Created by Julian Moorhouse on 03/05/2021.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    //@Published var value = 0
    // Here we can do more when object change is published.
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
