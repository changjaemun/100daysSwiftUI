//
//  ContentView.swift
//  ViewsAndModifier
//
//  Created by 문창재 on 2023/12/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            VStack(spacing: 10) {
                Text("First")
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(.capsule)
                    .blur(radius: 50)

                Text("Second")
                    .titleStyle()
            }.blur(radius: 50)
            
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
            Text("hello")
                .modifier(Title())
        }
        
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Rectangle())
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
