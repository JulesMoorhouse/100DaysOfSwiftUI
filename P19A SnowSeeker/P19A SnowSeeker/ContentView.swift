//
//  ContentView.swift
//  P19A SnowSeeker
//
//  Created by Julian Moorhouse on 19/05/2021.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                self.selectedUser = User()
            }
            .alert(item: $selectedUser) { user in
                // user is safely unwrapped
                Alert(title: Text(user.id))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
