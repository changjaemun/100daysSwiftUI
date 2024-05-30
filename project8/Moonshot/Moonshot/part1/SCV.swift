//
//  SCV.swift
//  Moonshot
//
//  Created by 문창재 on 5/26/24.
//

import SwiftUI

struct SCV: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) { //파라미터명 안보이게
        print("Creating a new CustomText")
        self.text = text
    }
}
#Preview {
    SCV()
}
