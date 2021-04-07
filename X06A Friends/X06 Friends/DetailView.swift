//
//  DetailView.swift
//  X06 Friends
//
//  Created by Julian Moorhouse on 04/04/2021.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    let userFriends: [User]
    let allUsers: [User]

    var body: some View {
        Form {
            Section {
                VStack(alignment: .center, spacing: 10) {
                    Text(user.initials)
                        .font(.largeTitle)
                        .padding(20)
                        .background(Color.gray.opacity(0.55))
                        .clipShape(Circle())
                        
                    Text(user.name)
                        .font(.largeTitle)
                }
                .frame(maxWidth: .infinity)
            }
            
            Section(header: Text("Details")) {
                HStack {
                    Text("Age")
                        .font(.headline)
                    Spacer()
                    Text("\(user.age)")
                }
                HStack {
                    Text("Email")
                        .font(.headline)
                    Spacer()
                    Text(user.email)
                }
                HStack {
                    Text("Company")
                        .font(.headline)
                    Spacer()
                    Text(user.company)
                }
                HStack {
                    Text("Registered")
                        .font(.headline)
                    Spacer()
                    Text(user.formattedRegisteredDate)
                }
                
            }
            
            Section(header: Text("Address")) {
                Text(user.address)
            }

            Section(header: Text("About")) {
                Text(user.about)
            }
            
            Section(header: Text("Tags")) {
                Text(user.tags.joined(separator: ", "))
            }
            
            Section(header: Text("Friends"))  {
                ForEach(self.userFriends, id: \.id) { friend in
                    
                    NavigationLink(destination: DetailView(user: friend, users: allUsers)) {
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationBarTitle(Text(user.name), displayMode: .inline)
    }
    
    init(user: User, users: [User]) {
        self.user = user
        self.allUsers = users;
        
        var matches = [User]()
        
        for friend in user.friends {
            if let match = users.first(where: { $0.id == friend.id}) {
                matches.append(match)
            } else {
                fatalError("Missing \(friend)")
            }
        }
        
        self.userFriends = matches
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user: [User] = []
        DetailView(user: user[0], users: user)
    }
}
