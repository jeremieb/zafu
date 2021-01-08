//
//  ContentView.swift
//  Shared
//
//  Created by Jeremie Berduck on 08/01/2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var timeRemaining = 10
    @State var isStoped = true
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Zazen")
                .font(.largeTitle)
                .fontWeight(.bold)
            if isStoped {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start timer")
                        .onTapGesture {
                            timeRemaining = 4
                            isStoped.toggle()
                        }
                }.buttonStyle(GradientButtonStyle())
            } else {
                Text("\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else if timeRemaining == 0 {
                            isStoped = true
                            playSound(sound: "bell", type: "wav")
                        }
                    }
            }
        }
        
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
