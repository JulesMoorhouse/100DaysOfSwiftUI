//
//  ContentView.swift
//  X02 View Modifier
//
//  Created by Julian Moorhouse on 18/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

// ViewModifier which makes a view have a large, blue font suitable for prominent titles in a view.

struct Prominent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominentStyle() -> some View {
        self.modifier(Prominent())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
        .prominentStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
