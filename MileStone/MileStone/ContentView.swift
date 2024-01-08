//
//  ContentView.swift
//  MileStone
//
//  Created by 문창재 on 2024/01/08.
// Rock Scissors Paper App
// 필요한 것
// 가위 바위 보 배열
// 랜덤 숫자 0~2
// Win Lose 토글 되는 Text 뷰
// 가위 바위 보 승 패 계산 함수
// 점수 담는 정수

import SwiftUI

struct ContentView: View {
    let rcp:[String] = ["Rock", "Scissors", "Paper"]
    let rcpWin:[String] = ["Scissors", "Paper", "Rock"]
    let rcpLose:[String] = ["Paper", "Rock", "Scissors"]
    let winOrLose:[String] = ["Win", "Lose", "Draw"]
    @State private var chooseWinOrLose = 0
    @State private var playerPick = 0
    @State private var randomInt:Int = Int.random(in: 0...2)
    @State private var Score = 0
    @State private var isShowResult = false
    func calWinOrLose(winOrLose:Int, bot:Int, player:Int){
        if winOrLose == 0{
            if rcp[bot] == rcpWin[player]{
                Score += 1
            }else{
                Score -= 1
            }
        }else{
            if rcp[bot] == rcpLose[player]{
                Score += 1
            }else{
                Score -= 1
            }
        }
    }
    
    var body: some View {
        VStack {
            Image(rcp[randomInt])
                .padding()
            HStack{
                ForEach(0..<2){ i in
                    Button(winOrLose[i]){
                        chooseWinOrLose = i
                    }
                }
            }
            HStack{
                ForEach(0..<3){ i in
                    Button(action: {playerPick = i}, label: {
                        Image(rcp[i])
                    })
                    
                }
            }
            HStack{
                Button{
                    calWinOrLose(winOrLose: chooseWinOrLose, bot: randomInt, player: playerPick)
                    randomInt = Int.random(in: 0...2)
                } label: {
                    Text("Fight!")
                }
            }
            
            Text("Your Score is \(Score)")
    
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
