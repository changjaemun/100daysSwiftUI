//
//  ContentView.swift
//  WordScramble
//
//  Created by 문창재 on 5/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }.listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
