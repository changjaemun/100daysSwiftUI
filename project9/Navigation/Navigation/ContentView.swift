//
//  ContentView.swift
//  Navigation
//
//  Created by 문창재 on 5/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var title = "Select"
    var body: some View {
//        NavigationStack {
//            NavigationLink("Tap Me") {
//                DetailView(number: 556)
//            }
//        }
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }.navigationTitle($title)
        }
    }
}

#Preview {
    ContentView()
}
