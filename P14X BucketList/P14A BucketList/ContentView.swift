//
//  ContentView.swift
//  P14A BucketList
//
//  Created by Julian Moorhouse on 11/04/2021.
//

import SwiftUI

struct ContentView: View {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {

                let JSON = """
                {
                    "title": "Optionals in Swift explained: 5 things you should know",
                    "url": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                    "views": 47093
                }
                """
                
                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try JSON.write(to: url, atomically: true, encoding: .utf8)
                    //let input = try String(contentsOf: url)
                    
                    let input: BlogPost = FileManager.default.decode("message.txt")
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
