//
//  MissionView.swift
//  P08D Moonshoot
//
//  Created by Julian Moorhouse on 19/02/2021.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(decorative: self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)

                    Text(self.mission.formattedLaunchDate)
                        .accessibility(label: Text("The \(self.mission.displayName) Launch Date \(self.mission.formattedLaunchDate)"))
                    Text(self.mission.description)
                        .padding()

                    ForEach(self.astronauts, id: \.role) {
                        crewMember in
                        NavigationLink(
                            destination: AstronautView(astronaut: crewMember.astronaut, missions: self.missions)) {
                                HStack() {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 83, height: 60)
                                        .clipShape(Capsule())
                                        .overlay(Capsule()
                                            .stroke(Color.primary, lineWidth: 1))
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .font(.headline)
                                
                                        Text(crewMember.role)
                                            .foregroundColor(.secondary)
                                    }
                                    .accessibilityElement(children: .ignore)
                                    .accessibility(label: Text("The  \(crewMember.role) of \(self.mission.displayName) was   \(crewMember.astronaut.name)"))
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    // Find all the astronauts for this mission
    init(mission: Mission, astronauts: [Astronaut], missions: [Mission]) {
        self.mission = mission
        self.missions = missions
        
        var matches = [CrewMember]()
        
        // So you have crew for each mission, where the key is the astronauts surname.
        // This key is then uses to find matches in the astronauts array
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts, missions: missions)
    }
}
