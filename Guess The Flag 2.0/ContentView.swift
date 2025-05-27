//
//  ContentView.swift
//  Guess The Flag 2.0
//
//  Created by Santhosh Srinivas on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
            Text("Hey Santhosh")
                .foregroundColor(.secondary)
                .padding(50)
                .background(.ultraThickMaterial)
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
