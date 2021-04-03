//
//  ContentView.swift
//  P12 CoreDataProject
//
//  Created by Julian Moorhouse on 03/04/2021.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
