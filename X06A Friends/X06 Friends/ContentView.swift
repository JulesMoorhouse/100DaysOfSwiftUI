//
//  ContentView.swift
//  X06 Friends
//
//  Created by Julian Moorhouse on 04/04/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.wrappedName)
                        Text("Friends: \(user.friendsArray.count)")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Friends")
        }
    }
    
    func loadData() {
        if !users.isEmpty {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        var jsonUsers = [JsonUser]()
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                if let decodedResponse = try? decoder.decode([JsonUser].self, from: data) {
                    DispatchQueue.main.async {
                        jsonUsers = decodedResponse
                        
                        var tmpUsers = [User]()

                        for usr in  jsonUsers {
                            let rec = User(context: moc)
                            rec.name = usr.name
                            rec.id = usr.id
                            rec.isActive = usr.isActive
                            rec.age = Int16(usr.age)
                            rec.company = usr.company
                            rec.email = usr.email
                            rec.about = usr.about
                            rec.address = usr.address
                            rec.registered = usr.registered
                            rec.tags = usr.tags.joined(separator: ", ")
                            
                            tmpUsers.append(rec)
                        }
                        
                        for i in 0..<jsonUsers.count {
                            for friend in jsonUsers[i].friends {
                                if let newFriend = tmpUsers.first(where: { $0.id == friend.id }) {
                                    tmpUsers[i].addToFriend(newFriend)
                                }
                            }
                        }

                        do {
                            try moc.save()
                        }
                        catch let error {
                            print("Could not save data: \(error.localizedDescription)")
                        }
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
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
