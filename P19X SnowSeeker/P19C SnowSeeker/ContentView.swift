//
//  ContentView.swift
//  P19C SnowSeeker
//
//  Created by Julian Moorhouse on 20/05/2021.
//

import SwiftUI

struct ContentView: View {
    enum FilterType {
        case none, countrySizeSmall, countrySizeAverage, countrySizeLarge, price1, price2, price3
    }
    
    enum SortType {
        case alphabetical, country
    }
    
    @ObservedObject var favourites = Favourites()
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var countries : [String] {
        let allCountries = resorts.map({ $0.country})
        let temp = Set(allCountries)
        return Array(temp)
    }
    
    @State private var showingActionSheet = false
    @State private var sort: SortType = .alphabetical
    @State private var showingFilterSheet = false

    let filter: FilterType

    var title: String {
        switch filter {
        case .none:
            return "All"
        case .countrySizeSmall:
            return "Small Country"
        case .countrySizeAverage:
            return "Average Country"
        case .countrySizeLarge:
            return "Large Country"
        case .price1:
            return "Price $"
        case .price2:
            return "Price $$"
        case .price3:
            return "Price $$"
        }
    }
    
    var filteredResorts: [Resort] {
        var result: [Resort]
        
        switch filter {
        case .none:
            result = resorts
        case .countrySizeSmall:
            result = resorts.filter { $0.size == 1 }
        case .countrySizeAverage:
            result = resorts.filter { $0.size == 2 }
        case .countrySizeLarge:
            result = resorts.filter { $0.size == 3 }
        case .price1:
            result = resorts.filter { $0.price == 1 }
        case .price2:
            result = resorts.filter { $0.price == 2 }
        case .price3:
            result = resorts.filter { $0.price == 3 }
        }
        
        switch sort {
        case .alphabetical:
            result.sort { $0.name < $1.name }
        case .country:
            result.sort { $0.country < $1.country }
        }
        return result
    }
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )

                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                    .frame(minWidth: 200, alignment: .leading)
                    .layoutPriority(1)
                    
                    if self.favourites.contains(resort) {
                        Spacer()
                            
                        Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favourite resort"))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showingActionSheet = true
                    }) {
                        Image(systemName: "arrow.up.arrow.down.square")
                        //Text("Sort")
                    }
                    
                    Button(action: {
                        self.showingFilterSheet = true
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                        //Text("Filter")
                    }
                }
            )
            .sheet(isPresented: $showingFilterSheet) {
                ResortFilterView(countries: countries)
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Sort order"), message: Text("Please select how to sort your contact."), buttons: [
                    .default(Text("Sort by name")) {
                        self.sort = .alphabetical
                    },
                    .default(Text("Sort by most recent")) {
                        self.sort = .country
                    },
                    .cancel()
                ])
            }
            
            WelcomeView()
        }
        .environmentObject(favourites)
        // .phoneOnlyStackNavigationView()
    }
}

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(filter: .none)
    }
}
