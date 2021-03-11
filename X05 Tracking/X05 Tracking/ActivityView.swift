//
//  ActivityView.swift
//  X05 Tracking
//
//  Created by Julian Moorhouse on 11/03/2021.
//

import SwiftUI

struct ActivityView: View {
    var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading) {
                Text(activity.title)
                    .font(.title)
                    .padding(.bottom)
            
                Text(activity.description)
                    .padding(.bottom)
            
                Text("\(activity.amount)")
                    .font(.headline)
                
            Button(action: {
                //self.activity.amount += 1
            }) {
                Text("+")
            }
            
            
                Spacer()
            }
        
    }
    
    init(activity: Activity) {
        self.activity = activity
    }
}
