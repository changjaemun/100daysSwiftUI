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
            Text("파란색 제목")
                .modifier(BlueText())
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

struct BlueText:ViewModifier{
    func body(content: Content) -> some View {
        content.foregroundColor(.blue)
    }// ViewModifier타입은 무조건 body 메소드를 만족해야하나보다.. 프로토콜인듯
}
extension View{//View 구조체에 익스텐션
    func makeBlueText() -> some View{
        modifier(BlueText())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
