//
//  BetterRest.swift
//  BetterRest
//
//  Created by 문창재 on 2024/01/10.
//

import SwiftUI
import CoreML

struct BetterRest: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    func calculateBedtime() {
    }
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)

                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()

                // more to come
                Text("Desired amount of sleep")
                    .font(.headline)

                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)

                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                
                Spacer()
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate"){
                    calculateBedtime()
                }
            }
        }
    }
}

#Preview {
    BetterRest()
}
