//
//  DetailView.swift
//  X06 Friends
//
//  Created by Julian Moorhouse on 04/04/2021.
//

import SwiftUI

struct DetailView: View {
    
    let user: User

    var body: some View {
        Form {
            Section {
                VStack(alignment: .center, spacing: 10) {
                    Text(user.initials)
                        .font(.largeTitle)
                        .padding(20)
                        .background(Color.gray.opacity(0.55))
                        .clipShape(Circle())
                        
                    Text(user.wrappedName)
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
                    Text(user.wrappedEmail)
                }
                HStack {
                    Text("Company")
                        .font(.headline)
                    Spacer()
                    Text(user.wrappedCompany)
                }
                HStack {
                    Text("Registered")
                        .font(.headline)
                    Spacer()
                    Text(user.formattedRegisteredDate)
                }
            }
            
            Section(header: Text("Address")) {
                Text(user.wrappedAddress)
            }

            Section(header: Text("About")) {
                Text(user.wrappedAbout)
            }
            
            Section(header: Text("Tags")) {
                Text(user.wrappedTags)
            }
            
            Section(header: Text("Friends"))  {
                ForEach(user.friendsArray) { friend in
                    
                    NavigationLink(destination: DetailView(user: friend)) {
                        Text(friend.wrappedName)
                    }
                }
            }
        }
        .navigationBarTitle(Text(user.wrappedName), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user: [User] = []
        DetailView(user: user[0])
    }
}
