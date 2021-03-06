//
//  ContentView.swift
//  X05 Tracking
//
//  Created by Julian Moorhouse on 09/03/2021.
//

import SwiftUI

struct Activity: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var amount: Int
}

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(activities.items) { item in
                        NavigationLink(destination:
                            ActivityView(activities: self.activities, selectedItem: item))
                        {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                    Text(item.description)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("\(item.amount)")
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("Activity Tracker")
                .navigationBarItems(leading: EditButton(),
                                    trailing:
                                    Button(action: {
                                        self.showingAddActivity = true
                                    }) {
                                        Image(systemName: "plus")
                                    })
                .sheet(isPresented: $showingAddActivity) {
                    AddView(activities: self.activities)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
