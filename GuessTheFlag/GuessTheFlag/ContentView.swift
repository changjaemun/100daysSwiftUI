//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 문창재 on 2023/11/23.
//

import SwiftUI

struct ContentView: View {
    func executeDelete(){
        print("deleting,,,")
    }
    @State private var showAlert:Bool = false
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
                ScrollView{
                    LinearGradient(colors: [.red,.black], startPoint: .top, endPoint: .bottom)
                        .frame(minWidth: 200, minHeight: 200)
                    LinearGradient(stops: [
                        Gradient.Stop(color: .blue, location: 0.5),
                        Gradient.Stop(color: .black, location: 0.5),
                    ], startPoint: .top, endPoint: .bottom)
                    .frame(minWidth: 200, minHeight: 200)
                    RadialGradient(colors: [.green,.gray], center: .center, startRadius: 20, endRadius: 100)
                        .frame(minWidth: 200, minHeight: 200)
                    AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
                        .frame(minWidth: 200, minHeight: 200)
                    Text("Your content")
                        .frame(minWidth: 200, minHeight: 200)
                        .foregroundStyle(.white)
                        .background(.red.gradient)
                       
                }
            }
            
                        .tabItem {
                            Image(systemName: "2.circle")
                            Text("Gradients")
                        }
            ScrollView{
                Button("Delete selection", role: .destructive, action: executeDelete)
                
                VStack {
                    Button("Button 1") { }
                        .buttonStyle(.bordered)
                    Button("Button 2", role: .destructive) { }
                        .buttonStyle(.bordered)
                    Button("Button 3") { }
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                    Button("Button 4", role: .destructive) { }
                        .buttonStyle(.borderedProminent)
                }
                Button {
                    print("Button was tapped")
                } label: {
                    Text("Tap me!")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }
                Button{
                    //action
                }label: {
                    Image(systemName: "pencil")
                }
                
                Button{
                    //action
                }label: {
                    Label("LabelType", systemImage: "pencil")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        
                        
                }
            }
            
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Button and Image")
                }
            
            Button("showalert"){
                showAlert = true
            }.alert("Important message", isPresented: $showAlert) {
                Button("OK") { }
                Button("Delete", role: .destructive) { }
                Button("cancel", role:.cancel){ }
                
            }message: {
                Text("Please read this.")
            }
            
            
            .tabItem {
                Image(systemName: "4.circle")
                Text("alert")
            }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
