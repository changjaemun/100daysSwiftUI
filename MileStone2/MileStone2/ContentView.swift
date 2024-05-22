//
//  ContentView.swift
//  MileStone2
//
//  Created by 문창재 on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplication = 2
    @State private var question = [5,10,20]
    @State private var questions = 5
    @State private var questionNumber:[String] = []
    
    func makeQuestion(num:Int, mul:Int){
        for _ in 0..<num{
            questionNumber.append("\(mul) X \(Int.random(in: 1..<10))")
        }
    }
    
    var body: some View {
        NavigationStack{
            List {
                Section{
                    Stepper("\(multiplication)단", value: $multiplication, in: 2...12)
                    Picker(selection: $questions, label: Text("Questions")) {
                        ForEach(question, id:\.self){
                            Text("\($0)")
                        }
                    }
                }
                
                Section{
                    NavigationLink("Start!"){
                        GameView(questionNumber: $questionNumber, questions: $questions)
                            .onAppear(perform: {
                                    makeQuestion(num: questions, mul: multiplication)
                            })
                    }
                }
            }.onAppear(perform: {
                questionNumber = []
            })
        }
        
    }
}

struct GameView:View {
    @Binding var questionNumber:[String]
    @Binding var questions:Int
    @State var writedAnswer:[String] = Array(repeating: "", count: 20)
    @State var checkedAnswer:[Bool?] = []
    
    var body: some View{
        NavigationStack{
            List(0..<questionNumber.count, id:\.self){i in
                Section{
                    HStack{
                        if checkedAnswer.count > 0{
                            Image(systemName: checkedAnswer[i] ?? false ? "circle" : "")
                        }
                        Text(questionNumber[i])
                    }
                    TextField(text: $writedAnswer[i]) {
                        Text("\(writedAnswer[i])")
                    }
                }
            }
        }.toolbar(content: {
            Button("check"){
                let q = questionNumber.map{i in Int(i.components(separatedBy: " X ")[0])! * Int(i.components(separatedBy: " X ")[1])!}
                
                for (index,a) in q.enumerated(){
                    if a == Int(writedAnswer[index])!{
                        checkedAnswer.insert(true, at: index)
                    }else{
                        checkedAnswer.insert(false, at: index)
                    }
                }
            }
        })
        
    }
}

#Preview {
    ContentView()
}
