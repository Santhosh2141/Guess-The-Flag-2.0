//
//  ContentView.swift
//  Guess The Flag 2.0
//
//  Created by Santhosh Srinivas on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var alertOption = false
    var body: some View {
        // gradients can be used w an array of color
        ZStack{
            VStack(spacing: 0){
                Color.red
//                LinearGradient(colors: [.red, .white, .blue], startPoint: .top, endPoint: .bottom)
                // Using the below method we can specify till where the colors should stop and start
                LinearGradient(stops: [
                    .init(color: .red, location: 0.45),
                    .init(color: .blue, location: 0.55),
                ], startPoint: UnitPoint.top, endPoint: .bottom)
                // all gradients have the stops part and can also be used as a background
//                RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)

                Color.blue

            }
            .ignoresSafeArea()
            
            VStack{
                Button("Hey Santhosh"){
                    print("Hi Santy!!")
                }
                    .foregroundStyle(.black)
                    .font(.largeTitle)
                    .padding(20)
                    .background(.red.gradient)
                Button("Click To Delete", role: .destructive, action: deleteButton)
//                    .foregroundStyle(.black)
                    .font(.largeTitle)
                    .padding(20)
                    .background(.blue.gradient)
                Button("Button 1"){ }
                    .buttonStyle(.bordered)
                    .background(.white)
                Button("Button 2", role: .destructive){ }
                    .buttonStyle(.bordered)
                    .background(.white)
                Button("Button 3"){ }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                Button("Button 4", role: .destructive){ }
                    .buttonStyle(.borderedProminent)
                // This is a custom button
                Button {
                    print("Button was tapped")
                } label: {
                    Text("Tap me!")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }

                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Edit", systemImage: "pencil")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }
                Button() {
                } label: {
                    Label("Edit", systemImage: "eraser.line.dashed")
                        .padding(10)
                        .foregroundColor(.black)
                        .background(.white)
                }
                Button(){
                    alertOption.toggle()
                } label: {
                    Label("Alert", systemImage: "light.beacon.max")
                        .padding(10)
                        .foregroundColor(.black)
                        .background(.white)
                }
//                Image(decorative: "saint-anton-am-arlberg")
//                Spacer()
//                Image(systemName: "pencil.circle")
//                    .foregroundStyle(.white)
//                    .font(.largeTitle)
                
            }
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
            
        }
        .ignoresSafeArea()
        .alert("Important Message" ,isPresented: $alertOption) {
            Button("OK"){
                // button automatically toggles the alert
            }
        }
    message: {
        Text("Please read this.")
    }
    }
    func deleteButton() {
        print("Deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
