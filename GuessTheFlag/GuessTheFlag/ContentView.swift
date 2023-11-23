//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 문창재 on 2023/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                    // 첫 번째 탭
            ZStack{
                Color.red
                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                Text("First Tab")
            }.ignoresSafeArea()
            .tabItem {
                            Image(systemName: "1.circle")
                            Text("Color and Frame")
                        }
                    
                    // 두 번째 탭
            VStack{
                LinearGradient(colors: [.red,.black], startPoint: .top, endPoint: .bottom)
                LinearGradient(stops: [
                    Gradient.Stop(color: .blue, location: 0.5),
                    Gradient.Stop(color: .black, location: 0.5),
                ], startPoint: .top, endPoint: .bottom)
                RadialGradient(colors: [.green,.gray], center: .center, startRadius: 20, endRadius: 100)
            }
            
            //어떤 색, 방향, 타입 지정
                        .tabItem {
                            Image(systemName: "2.circle")
                            Text("Gradients")
                        }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
