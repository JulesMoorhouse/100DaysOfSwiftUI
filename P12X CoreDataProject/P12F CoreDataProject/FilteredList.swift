//
//  FilteredList.swift
//  P12F CoreDataProject
//
//  Created by Julian Moorhouse on 03/04/2021.
//

import CoreData
import SwiftUI

enum Predicate {
    case lessThan, beginsWith
}
struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, sort: [NSSortDescriptor], predicate: Predicate, @ViewBuilder content: @escaping (T) -> Content) {
        
        var predicateString = "%K BEGINSWITH %@"
        if predicate == .lessThan {
            predicateString = "%K < %@"
        }
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sort, predicate: NSPredicate(format: predicateString, filterKey, filterValue))
        self.content = content
    }
}
