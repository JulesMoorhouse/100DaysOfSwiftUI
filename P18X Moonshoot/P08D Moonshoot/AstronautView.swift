//
//  AstronautView.swift
//  P08D Moonshoot
//
//  Created by Julian Moorhouse on 19/02/2021.
//

import SwiftUI

struct AstronautView: View {
    struct AstronautMission {
        let id: Int
        
        var missionName: String {
            "Apollo \(id)"
        }
    }
    
    let astronaut: Astronaut
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(decorative: self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.missions) { mission in
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 44, height: 44)

                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                }
                            }
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding(.horizontal)
                            .accessibilityElement(children: .ignore)
                            .accessibility(label: Text("Mission \(mission.displayName) \(mission.formattedLaunchDate)"))
                        }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            for member in mission.crew {
                if member.name == astronaut.id {
                    matches.append(mission)
                }
            }
        }
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
