//
//  ContentView.swift
//  Guess The Flag 2.0
//
//  Created by Santhosh Srinivas on 27/05/25.
//

import SwiftUI

struct ContentView: View {
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
            Text("Hey Santhosh")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.blue.gradient)
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
            // this makes the zstack alone red.
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
