//
//  ControllAnimationStack.swift
//  Animation
//
//  Created by 문창재 on 5/17/24.
//

import SwiftUI

struct ControllAnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue:.red)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.default, value: enabled)
        
    }
}

#Preview {
    ControllAnimationStack()
}
