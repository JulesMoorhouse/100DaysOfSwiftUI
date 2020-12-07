//
//  ContentView.swift
//  P06B WordScramble
//
//  Created by Julian Moorhouse on 06/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        if let fileURL = Bundle.main.url(forResource: "some-files", withExtension: "txt") {
        //            if let fileContents = try? String(contentsOf: fileURL) {
        //
        //            }
        //        }
        //        return Text("Hello, World!")
                // ---
        //        let input = "a b b"
        //        let letters = input.components(separatedBy: " ")
        // ---
//        let input = """
//                    a
//                    b
//                    c
//                    """
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        // ---
        // Check of mispelled words
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
