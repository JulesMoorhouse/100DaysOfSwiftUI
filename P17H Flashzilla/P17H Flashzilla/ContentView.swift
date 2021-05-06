//
//  ContentView.swift
//  P17H Flashzilla
//
//  Created by Julian Moorhouse on 06/05/2021.
//

import SwiftUI

struct ContentView: View {
    // Every second, but system makes no guarantee it will execute precisely
   //let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Tolerance allows the device to perform important energy optimation with the tolerance amount.
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text("Hello, world!")
            .onReceive(timer) { time in
                //print("The time is now \(time)")
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    // writes time 5 times
                    print("The time is now \(time)")
                }
                
                self.counter += 1
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
