//
//  ProspectsView.swift
//  P16I HotProspects
//
//  Created by Julian Moorhouse on 03/05/2021.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
        return "Contacted people"
        case .uncontacted:
        return "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationView {
        Text("Hello, World!")
            .navigationTitle(title)
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
