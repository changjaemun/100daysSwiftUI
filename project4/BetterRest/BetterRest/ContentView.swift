//
//  ContentView.swift
//  BetterRest
//
//  Created by 문창재 on 4/26/24.
//

import SwiftUI
import CoreML


struct ContentView: View {
    @State private var sleepAmount = 8.0 // 수면 양
    @State private var wakeUp = defaultWakeTime//
    @State private var coffeeAmount = 1 // 커피 양

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    } // static - 정적 변수는 다른 프로퍼티에 의존하지 않는다.
    
    func calculateBedtime(){
        do {
            let config = MLModelConfiguration() //모델 cofig
            let model = try SleepCalculator(configuration: config) // 모델 인스턴스 만들기
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 //초 단위로 통일하려고
            let minute = (components.minute ?? 0) * 60 //초 단위로 통일하려고
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount))) // 계산
            
            let sleepTime = wakeUp - prediction.actualSleep // 일어날 시간에 계산값 빼기 = 언제 자야하는지 알려줌
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            // more code here
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    var body: some View {
        NavigationView{
            Form{
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)

                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                }
                
                
                VStack(alignment: .leading, spacing: 0)  {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount.formatted()) hours")
                    }
                }
                
                
                
                VStack(alignment: .leading, spacing: 0)  {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)//SwiftUI제공하는 복수화 코드 ㄷㄷ 신기

                }

                
                
            }.navigationTitle("BetterRest")
                .toolbar {
                    Button("Calculate", action: calculateBedtime)
                }
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("OK") { 
                        
                    }
                } message: {
                    Text(alertMessage) // 언제 자야하는지
                }
        }
        
        
    }
}

#Preview {
    ContentView()
}

//Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//    Text("\(sleepAmount.formatted()) hours")
//} // stepper는 범위와 값 수정 스텝을 설정할 수 있음
//
//DatePicker("", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
//    .labelsHidden()
//// 얘도 지정 범위 정할 수 있음
