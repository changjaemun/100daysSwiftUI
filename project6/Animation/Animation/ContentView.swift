//
//  ContentView.swift
//  Animation
//
//  Created by 문창재 on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationRotateAmount = 0.0
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation(.spring(duration: 0.1, bounce: 0.5).repeatForever(autoreverses: true)) {
                    animationRotateAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            //.scaleEffect(animationAmount)
            .rotation3DEffect(.degrees(animationRotateAmount), axis: (x: 0, y: 1, z: 0))
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            
            .animation(
                .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true),
                value: animationAmount
            )
            //.blur(radius: (animationAmount - 1) * 3)
        }.onAppear {
            animationAmount = 2
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
