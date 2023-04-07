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
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}