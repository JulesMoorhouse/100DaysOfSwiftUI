//
//  ContentView.swift
//  P05C WordScramble
//
//  Created by Julian Moorhouse on 07/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = ["Arthur", "Ford", "Trillian", "Zaphod", "Marvin"]
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            GeometryReader { full in

                VStack {
                    TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                    List(usedWords, id: \.self) { word in
                        VStack {
                            GeometryReader { geo in
                                HStack {
                                    Image(systemName: "\(word.count).circle")
                                    Text(word)
                                }
                                .offset(x: calcOffsetX(itemGeo: geo, fullGeo: full), y: 0)
//                                .onTapGesture {
//                                    print("Global midy: \(geo.frame(in: .global).midY)")
//                                    print("Local midy : \(geo.frame(in: .local).midY)")
//                                    print("Global h   : \(full.frame(in: .global).size.height)")
//                                    print("Local h    : \(full.frame(in: .local).size.height)")
//
//                                    print("---")
//                                }
                            }
                            .frame(height: 25)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibility(label: Text("\(word), \(word.count) letters"))
                    }
                    Text("Score: \(score)")
                        .font(.headline)
                        .padding()
                }
                .navigationBarTitle(rootWord)
                .navigationBarItems(trailing: Button(action: startGame) {
                    Text("Restart")
                })
                .onAppear(perform: startGame)
                .alert(isPresented: $showingError) {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    // Calculate offset for slide right to left effect when scrolling
    func calcOffsetX(itemGeo: GeometryProxy, fullGeo: GeometryProxy) -> CGFloat {
        // Top Row
        //---
        //Global midy: 248.5
        //Local midy : 12.5
        //Global h   : 551.0
        //Local h    : 551.0

        // Bottom Row
        //---
        // Global midy: 577.5
        // Local midy : 12.5
        // Global h   : 551.0
        // Local h    : 551.0
        
        let midY = (itemGeo.frame(in: .global).midY) - 26.5
        let listHeight = fullGeo.frame(in: .local).size.height
        let scrollFactor = midY / listHeight
        let width = itemGeo.frame(in: .local).size.width
        let position = (scrollFactor * width) - 250//130
        return position > 0 ? position : 0
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word")
            return
        }
        
        guard isShort(word: answer) else {
            wordError(title: "Word is short", message: "You word must be more than 3 characters!")
            return
        }
        
        guard isSame(word: answer) else {
            wordError(title: "Same word", message: "Your word is the same as the base word!")
            return
        }
        
        usedWords.insert(answer, at: 0)
        newWord = ""
        score += 1
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                newWord = ""
                score = 0
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func isShort(word: String) -> Bool {
        if word.count <= 3 {
            return false
        }
        return true
    }
    
    func isSame(word: String) -> Bool {
        if word == rootWord {
            return false
        }
        return true
    }
    
    func wordError(title: String, message: String) {
        score -= 1
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
