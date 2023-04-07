//
//  ContentView.swift
//  WordScramble
//
//  Created by Edmond Podlegaev on 07.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords  = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word: ", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) {word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
            newWord = ""
        }
    }
    
    func startGame() {
        if let dictionaryWordsURL = Bundle.main.url(forResource: "Dictionary", withExtension: "txt") {
            if let dictionaryWords = try? String(contentsOf: dictionaryWordsURL) {
                let allWords = dictionaryWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load Dictionary.txt from bunlde")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
