//
//  ContentView.swift
//  Guess The Flag 2.0
//
//  Created by Santhosh Srinivas on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            Spacer()
            Text("Hello, world!")
            Text("This is another text")
            HStack(alignment: .bottom, spacing: 10){
                Text("Hello, world!")
                Text("This is another text")
                Text("This is the third text")
            }
            HStack(alignment: .bottom, spacing: 10){
                Text("Hello, world!")
                Text("This is another text")
                Text("This is the third text")
            }
            HStack(alignment: .bottom, spacing: 10){
                Text("Hello, world!")
                Text("This is another text")
                Text("This is the third text")
            }
            ZStack(alignment: .top){
                Text("Hello, world!")
                Text("This is another text")
            }
            Spacer()
            //Spacer takew all the remaining spaces
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
