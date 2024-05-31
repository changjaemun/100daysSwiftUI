//
//  CodablePath.swift
//  Navigation
//
//  Created by 문창재 on 5/31/24.
//

import Foundation
import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct PathDetailView: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct PathContentView: View {
    @State private var pathStore = PathStore()
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            PathDetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    PathDetailView(number: i)
                        
                }
        }
    }
}

#Preview(body: {
    PathContentView()
})
