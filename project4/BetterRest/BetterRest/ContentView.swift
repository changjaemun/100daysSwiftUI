//
//  ContentView.swift
//  BetterRest
//
//  Created by 문창재 on 2024/01/10.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    func exampleDates() {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        let range = Date.now...tomorrow
    }
    func today(){
        var components = DateComponents() // 전체 날짜가 아닌 특정 날짜 읽고 쓸 때
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
    }

    var body: some View {
        VStack {
            Text(Date.now.formatted(date: .long, time: .standard))
                .padding()
            Text(Date.now, format: .dateTime.day().hour().minute())
                .padding()
            
            Stepper(value: $sleepAmount, in: 3...12, step: 0.25) {
                Text("\(sleepAmount.formatted())")
            }
            DatePicker(selection: $wakeUp, /*displayedComponents: .hourAndMinute 어떤 컴포넌트 보여줄지*/ in: Date.now...){
                Text("Please enter a date")
            }.labelsHidden()
            
//            DatePicker(selection: $wakeUp){
//                Text("")
//            } 위랑 차이점 인지
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
