//
//  WelcomeView.swift
//  P19C SnowSeeker
//
//  Created by Julian Moorhouse on 20/05/2021.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Welcome to SnowSeeker!")
            .font(.largeTitle)
        
        Text("Please select a resort from the left-hand menu; swipe from the left edge to show it")
            .foregroundColor(.secondary)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
