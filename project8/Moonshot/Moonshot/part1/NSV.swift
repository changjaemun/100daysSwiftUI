//
//  NSV.swift
//  Moonshot
//
//  Created by 문창재 on 5/26/24.
//

import SwiftUI

struct NSV: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NSV()
}
