//
//  PersonalView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 01/05/2021.
//

import SwiftUI

struct PersonalView: View {
    @Binding var firstName: String
    @Binding var lastName: String

    var body: some View {
        Section(header: Text("").accessibility(hidden: true)) {
            VStack(alignment: .leading, spacing: 0) {
                TextField("First Name", text: $firstName)
            }

            VStack(alignment: .leading, spacing: 0) {
                TextField("Last Name", text: $lastName)
            }
        }
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView(firstName: .constant("Paul"), lastName: .constant("Hudson"))
    }
}
