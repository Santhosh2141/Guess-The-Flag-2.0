//
//  ContentView.swift
//  Guess The Flag 2.0
//
//  Created by Santhosh Srinivas on 27/05/25.
//

import SwiftUI

struct FlagImage: View{
    
    var countryFlag: String
    var animationValue: Double
    var selected: Int
    var number: Int
    var animationApplied: Bool
    var falseAnimation: Bool
    
    var body: some View{
        VStack{
            Image(countryFlag)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(radius: 10)
            // adding spinApplied so that when its true only it spins. if we click wrong button there should be no spin to the clicked flag
                .rotation3DEffect(.degrees(animationApplied && number == selected ? animationValue : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
            // by default, opacityApplied is false. so all will be opaque.
            // when we click correct button, opacityApplied = true and number == selected is false. so 1 opacity and other 2 buttons, number!=selected will also be true so 0.25
                .opacity(animationApplied && number != selected ? 0.25 : 1)
                .scaleEffect(animationApplied && number == selected ? 1.5 : 1)
                .blur(radius: (falseAnimation && number == selected ? 5 : 0))
                .rotation3DEffect(.degrees(animationApplied && number != selected ? -animationValue : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
//
        }
    }
}

struct ContentView: View {
//    @State private var alertOption = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Italy", "Nigeria", "Ireland", "Poland", "Spain", "US", "Ukraine", "UK"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var questionNumber = 1
    @State private var maxQuestion = false
    
    @State private var selectedFlag = 0
    @State private var animationValue = 0.0
    @State private var animationApplied = false
    @State private var falseAnimation = false
    
    var body: some View {
        ZStack{
//            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 1),
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 1)
            ], center: .top, startRadius: 500, endRadius: 800)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 40){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ForEach(0..<3) { number in
                        Button{
                            // four shapes in swiftui.
                            //RECTANGLE, ROUNDED RECTANGLE,
                            // CIRCLE, CAPSULE
                            flagTapped(number)
                            
                            // once the function is run, selectedFlag is assigned the number.
                            // now we update animation amount if both are same.
                            if correctAnswer == selectedFlag {
                                withAnimation(.spring(response: 1, dampingFraction: 0.5)){
                                    animationValue += 360
                                    // when the flag is correct, we make the opacity true.
//                                    opacityApplied = true
                                }
                            }
                            
                        } label: {
//                            FlagImage(countryFlag: countries[number],spi animationValue: animationValue)
                            FlagImage(countryFlag: countries[number], animationValue: animationValue, selected: selectedFlag, number: number, animationApplied: animationApplied, falseAnimation: falseAnimation)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .padding(.bottom, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                Spacer()
                Spacer()
                Text("Question: \(questionNumber)/8")
                    .padding(.top, 25)
                    .foregroundStyle(.white)
                    .font(.headline.bold())
                Text("Score: \(score)")
                    .padding(.top, 5)
                    .foregroundStyle(.white)
                    .font(.headline.bold())
                Spacer()
            }
            .padding(25)
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: replayGame)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("""
            You've reached the end.
            Do you wish to restart?
            """, isPresented: $maxQuestion) {
            Button("Restart", action: restartGame)
//            questionNumber = 1
        } message: {
            Text("You got a score of \(score)/8")
        }
        
        // gradients can be used w an array of color
//        ZStack{
//            VStack(spacing: 0){
//                Color.red
////                LinearGradient(colors: [.red, .white, .blue], startPoint: .top, endPoint: .bottom)
//                // Using the below method we can specify till where the colors should stop and start
//                LinearGradient(stops: [
//                    .init(color: .red, location: 0.45),
//                    .init(color: .blue, location: 0.55),
//                ], startPoint: UnitPoint.top, endPoint: .bottom)
//                // all gradients have the stops part and can also be used as a background
////                RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
////                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//
//                Color.blue
//
//            }
//            .ignoresSafeArea()
//
//            VStack{
//                Button("Hey Santhosh"){
//                    print("Hi Santy!!")
//                }
//                    .foregroundStyle(.black)
//                    .font(.largeTitle)
//                    .padding(20)
//                    .background(.red.gradient)
//                Button("Click To Delete", role: .destructive, action: deleteButton)
////                    .foregroundStyle(.black)
//                    .font(.largeTitle)
//                    .padding(20)
//                    .background(.blue.gradient)
//                Button("Button 1"){ }
//                    .buttonStyle(.bordered)
//                    .background(.white)
//                Button("Button 2", role: .destructive){ }
//                    .buttonStyle(.bordered)
//                    .background(.white)
//                Button("Button 3"){ }
//                    .buttonStyle(.borderedProminent)
//                    .tint(.green)
//                Button("Button 4", role: .destructive){ }
//                    .buttonStyle(.borderedProminent)
//                // This is a custom button
//                Button {
//                    print("Button was tapped")
//                } label: {
//                    Text("Tap me!")
//                        .padding()
//                        .foregroundStyle(.white)
//                        .background(.red)
//                }
//
//                Button {
//                    print("Edit button was tapped")
//                } label: {
//                    Label("Edit", systemImage: "pencil")
//                        .padding()
//                        .foregroundStyle(.white)
//                        .background(.red)
//                }
//                Button() {
//                } label: {
//                    Label("Edit", systemImage: "eraser.line.dashed")
//                        .padding(10)
//                        .foregroundColor(.black)
//                        .background(.white)
//                }
//                Button(){
//                    alertOption.toggle()
//                } label: {
//                    Label("Alert", systemImage: "light.beacon.max")
//                        .padding(10)
//                        .foregroundColor(.black)
//                        .background(.white)
//                }
//                Image(decorative: "saint-anton-am-arlberg")
//                Spacer()
//                Image(systemName: "pencil.circle")
//                    .foregroundStyle(.white)
//                    .font(.largeTitle)
                
//            }
//
//            Color.orange
//                .ignoresSafeArea()
//            Color.red
//                .frame(width: 200, height: 400)
//            Color.primary
//                .frame(width: 100,height: 200)
//            Color(red: 1, green: 0.8, blue: 1)
//                .frame(width: 50, height: 100)
//            Text("Your Content")
//                .foregroundColor(.blue)
//                .fontWeight(.heavy)
//                .background(.red)
//             this makes the zstack alone red.
            
//        }
//        .ignoresSafeArea()
//        .alert("Important Message" ,isPresented: $alertOption) {
//            Button("OK"){
//                // button automatically toggles the alert
//            }
//        }
//    message: {
//        Text("Please read this.")
//    }
    }
//    func deleteButton() {
//        print("Deleting")
//    }
    func flagTapped(_ number: Int){
        selectedFlag = number
        if number == correctAnswer {
            score += 1
            scoreTitle = "You've picked the Right Flag"
            animationApplied = true
            falseAnimation = false
            if questionNumber == 8 {
                maxQuestion = true
                return
            }
        } else {
            animationApplied = false
            falseAnimation = true
            scoreTitle = "Wrong you chose \(countries[number])"
            if questionNumber == 8 {
                maxQuestion = true
                return
            }
        }
        showingScore = true
        questionNumber += 1
    }
    
    func replayGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        // after a round is over, resetting opacityApplied
        animationApplied = false
        falseAnimation = false
    }
    
    func restartGame(){
        score = 0
        questionNumber = 1
        animationApplied = false
        falseAnimation = false
        replayGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
