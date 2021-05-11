//
//  ContentView.swift
//  P18E LayoutAndGeometry
//
//  Created by Julian Moorhouse on 11/05/2021.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) {
                        d in d[VerticalAlignment.center]
                    }
                Image("apollo13")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("More text")
                Text("Example text")
                Text("Whatever")
                Text("It will still align")
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) {
                        d in d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
