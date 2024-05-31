//
//  ReturnRootView.swift
//  Navigation
//
//  Created by 문창재 on 5/30/24.
//

import SwiftUI

struct ReturnRootView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path){
            RandomDetailView(path: $path, number: 10)
                .navigationDestination(for: Int.self) { i in
                    RandomDetailView(path: $path, number: i)
                }
        }

    }
}

struct RandomDetailView: View {
    @Binding var path: [Int]
    
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                    //path = NavigationPath()
                }
            }
    }
}

#Preview {
    ReturnRootView()
}
