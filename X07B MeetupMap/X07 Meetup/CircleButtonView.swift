//
//  CircleButtonView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 01/05/2021.
//

import SwiftUI

struct CircleButtonView: View {
    let imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.secondary.opacity(0.4))
                .frame(width: 40, height: 40)

            Button(action: {
                //
            }) {
                Image(systemName: imageName)
                    .frame(width: 40, height: 40)
            }
            .accessibility(hidden: true)
        }
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(imageName: "photo")
    }
}
