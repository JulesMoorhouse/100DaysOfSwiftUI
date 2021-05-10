//
//  SettingsView.swift
//  P17M Flashzilla
//
//  Created by Julian Moorhouse on 10/05/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var settings = Settings(loseWrongCards: true)
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $settings.loseWrongCards.animation()) {
                        Text("Lose wrong cards")
                    }
                }                
            }
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
            .listStyle(GroupedListStyle())
            .onAppear(perform: loadData)
        }
        // Override empty detail view
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func dismiss() {
        saveData()
        presentationMode.wrappedValue.dismiss()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Settings") {
            if let decoded = try? JSONDecoder().decode(Settings.self, from: data) {
                self.settings = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: "Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
