//
//  TimerView.swift
//  Zafu
//
//  Created by Jeremie Berduck on 08/01/2021.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining = 10
    @State var isStoped = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader{ geometry in
            
            ZStack {
                VStack(alignment: .center) {
                    
                    /// Define a spacer with the height of half of the screen
                    Spacer().frame(height: geometry.size.height / 6)
                    
                    HStack {
                        
                        /// 15 minutes
                        VStack(alignment: .center) {
                            Text("15").font(.system(size: 80, weight: .heavy, design: .serif))
                            Text("minutes").font(.system(size: 17, weight: .regular, design: .serif)).foregroundColor(.secondaryColor)
                            Circle().frame(width: 12, height: 12, alignment: .center)
                        }.foregroundColor(.mainColor)
                        
                        Spacer().frame(width: geometry.size.width / 3.2)
                        
                        /// 20 minutes
                        VStack(alignment: .center) {
                            Text("20").font(.system(size: 80, weight: .heavy, design: .serif))
                            Text("minutes").font(.system(size: 17, weight: .regular, design: .serif)).foregroundColor(.secondaryColor)
                            Circle().frame(width: 12, height: 12, alignment: .center).opacity(0)
                        }.foregroundColor(.secondaryColor)
                    }

                }.padding(.horizontal, 28).frame(width: geometry.size.width)
                
                VStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Start").font(.system(size: 22, weight: .heavy, design: .serif)).foregroundColor(.mainColor).textCase(.uppercase)
                    }
                    Spacer().frame(height: 30)
                }
            }
        }
        
        //        VStack(alignment: .leading) {
        //            if isStoped {
        //                HStack {
        //                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
        //                        Text("15 minutes")
        //                            .onTapGesture {
        //                                timeRemaining = 900
        //                                isStoped.toggle()
        //                            }
        //                    }.buttonStyle(GradientButtonStyle())
        //                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
        //                        Text("20 minutes")
        //                            .onTapGesture {
        //                                timeRemaining = 1200
        //                                isStoped.toggle()
        //                            }
        //                    }.buttonStyle(GradientButtonStyle())
        //                }
        //            } else {
        //                Text("\(timeString(time: TimeInterval(timeRemaining)))")
        //                    .font(.largeTitle)
        //                    .fontWeight(.heavy)
        //                    .multilineTextAlignment(.center)
        //                    .onReceive(timer) { _ in
        //                        if timeRemaining > 0 {
        //                            timeRemaining -= 1
        //                        } else if timeRemaining == 0 {
        //                            isStoped = true
        //                            playSound(sound: "bell", type: "wav")
        //                        }
        //                    }
        //            }
        //        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let hour = Int(time) / 3600
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60
        
        // return formated string
        return String(format: "%02i:%02i:%02i", hour, minute, second)
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
