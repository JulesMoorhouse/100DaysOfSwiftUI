//
//  ContentView.swift
//  P08D Moonshot
//
//  Created by Julian Moorhouse on 19/02/2021.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showDetailLaunchDate = false

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination:
                    MissionView(mission: mission,
                                astronauts: self.astronauts,
                                missions: self.missions)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(!self.showDetailLaunchDate ?
                            mission.formattedLaunchDate :
                            mission.crewDisplay)
                            .foregroundColor(.secondary)
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibility(label: Text("Mission \(mission.displayName) \(mission.formattedLaunchDate)"))

                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(self.showDetailLaunchDate ?
                    "Show Dates" :
                    "Show Crew") {
                    self.showDetailLaunchDate.toggle()
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
