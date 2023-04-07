//
//  Overview.swift
//  WordScramble
//
//  Created by Edmond Podlegaev on 07.04.2023.
//

import SwiftUI

let people = ["Finn", "Leia", "Luke", "Rey"]

struct Overview: View {
    var body: some View {
        List {
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }
            
            Section("Section 2") {
                ForEach(1..<5) {
                    Text("Dynamic row \($0)")
                }
            }
            
            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        .listStyle(.grouped)
        
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
        .listStyle(.plain)
        
        List(people, id: \.self) {
            Text($0)
        }
        .listStyle(.insetGrouped)
    }
    
    func loadFile(){
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // pass
            }
        }
    }
    
    func newTest() {
        var input = "a b c"
        var letters = input.components(separatedBy: " ")
        
        input = """
                a
                b
                c
                """
        
        letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func oldTest() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}
