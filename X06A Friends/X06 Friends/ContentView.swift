//
//  ContentView.swift
//  X06 Friends
//
//  Created by Julian Moorhouse on 04/04/2021.
//

import SwiftUI
import CoreData


struct ContentView: View {
   // @Environment(\.managedObjectContext) var moc

    @State var users = [User]()

    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: DetailView(user: user, users: users)) {
                    Text(user.name)
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Friends")
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                if let decodedResponse = try? decoder.decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                    
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
