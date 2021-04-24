//
//  ContentView.swift
//  P14E BucketList
//
//  Created by Julian Moorhouse on 22/04/2021.
//

import LocalAuthentication
import MapKit
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var showError = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            if isUnlocked {
                UnlockedView()
            } else {
                Button("Unlock Places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        .alert(isPresented: $showError) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")) {
                self.showError = false
            })
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                        self.errorTitle = "Authentication"
                        self.errorMessage = "There has been an authentication issue: \(authenticationError?.localizedDescription ?? "Unknown error")"
                        self.showError = true
                    }
                }
            }
        } else {
            // no biometrics
            self.errorTitle = "Biometrics"
            self.errorMessage = "Sorry your device doesn't support biometrics authentication!"
            self.showError = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
