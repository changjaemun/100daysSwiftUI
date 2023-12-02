// Steps
// 1. store game data

import SwiftUI

struct GuessTheFlagView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingTotalScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var index = 1
    @State var judgedScore:[String] = []
    
    func flagTapped(_ number: Int) {
    
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            judgedScore.append("O")
        } else {
            scoreTitle = "Wrong\n That's flag of \(countries[number])"
            judgedScore.append("X")
        }
            showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        index += 1
    }
    
    func reset(){
        index = 1
        score = 0
        countries.shuffle()
    }
    
    func showTotalScore(){
        showingTotalScore = true
    }
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Spacer()
                Text("\(index)/8")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                //Spacer()
                VStack(spacing: 15) {
                    VStack {
                            Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                            Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                        }
                    
                    ForEach(0..<3) { number in
                            Button {
                               flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                            }
                    }
                    
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
            }.padding()
            
            
        }.alert(scoreTitle, isPresented: $showingScore){
            if index == 8{
                Button("Restart Game", action: reset)
                Button("Show Total Score", action: showTotalScore)
            }else{
                Button("Continue", action: askQuestion)
            }
        }message: {
                Text("Your score is \(score)/8")
        }
        .sheet(isPresented: $showingTotalScore) {
            VStack{
                ForEach(0..<8){ index in
                    Text("\(index+1). \(judgedScore[index])")
                }
                Button("Restart Game"){
                    reset()
                    showingTotalScore = false
                }
            }
        }
    }
}



struct GuessTheFlagView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagView()
    }
}


