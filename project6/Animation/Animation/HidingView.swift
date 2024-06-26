//
//  HidingView.swift
//  Animation
//
//  Created by 문창재 on 5/17/24.
//

import SwiftUI

struct HidingView: View {
    @State private var isShowingRed = false

    var body: some View {
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }

                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
        }
}

#Preview {
    HidingView()
}
