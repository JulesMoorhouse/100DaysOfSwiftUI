//
//  ResortView.swift
//  P19C SnowSeeker
//
//  Created by Julian Moorhouse on 20/05/2021.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var selectedFacility: Facility?
    
    let resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack {
                                SkiDetailsView(resort: resort)

                            }
                            VStack {
                                ResortDetailsView(resort: resort)
                            }
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                            
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility
                                }
                        }
                    }
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
        .alert(item: $selectedFacility) { facility in
            facility.alert
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
