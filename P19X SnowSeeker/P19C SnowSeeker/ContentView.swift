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
        var arr = Array(temp)
        arr.insert("All", at: 0)
        return arr
    }
    
    @State private var showingActionSheet = false
    @State private var sort: SortType = .alphabetical
    @State private var filter = Filter()
    @State private var showingFilterSheet = false

    var filteredResorts: [Resort] {
        var result: [Resort]
        
        result = resorts.filter { filter.matchCountry(country: $0.country) && filter.matchPrice(price: $0.price) && filter.matchCountrySize(size: $0.size)}

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
            VStack {
                if filteredResorts.count > 0 {
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
                }
                else {
                    Text("No resorts matching this critera")
                        .foregroundColor(.secondary)
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
                ResortFilterView(filter: $filter, countries: countries)
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Sort order"), message: Text("Please select how to sort your resort."), buttons: [
                    .default(Text("By alphabetical")) {
                        self.sort = .alphabetical
                    },
                    .default(Text("By country")) {
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
        ContentView()
    }
}
