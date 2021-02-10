//
//  TimerView.swift
//  Zafu
//
//  Created by Jeremie Berduck on 08/01/2021.
//

import SwiftUI

struct TimerView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var selectedButton = 0
    @State var timeRemaining = 0
    @State var isStoped = false
    
    @AppStorage("firstTimer") var firstTimer: Int = 900
    @AppStorage("secondTimer") var secondTimer: Int = 1200
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader{ geometry in
            
            // MARK: - TIMER IS NOT RUNNING
            
            if isStoped { /// Timer is not running
                
                ZStack {
                    
                    QuotesView()
                    
                    VStack(alignment: .center) {
                        
                        /// Define a spacer with the height of half of the screen
                        Spacer().frame(height: geometry.size.height / 6)
                        
                        HStack {
                            
                            /// 15 minutes
                            VStack {
                                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                    VStack(alignment: .center) {
                                        Text("\(Int(firstTimer) / 60 % 60)").font(.system(size: 80, weight: .heavy, design: .serif))
                                        Text("minutes").font(.system(size: 17, weight: .regular, design: .serif)).foregroundColor(.secondaryColor)
                                    }.foregroundColor(.mainColor)
                                }
                                
                                /// Selection Indicator
                                Circle().frame(width: 12, height: 12, alignment: .center)
                            }
                            
                            Spacer().frame(width: geometry.size.width / 3.2)
                            
                            /// 20 minutes
                            VStack {
                                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                    VStack(alignment: .center) {
                                        Text("\(Int(secondTimer) / 60 % 60)").font(.system(size: 80, weight: .heavy, design: .serif))
                                        Text("minutes").font(.system(size: 17, weight: .regular, design: .serif)).foregroundColor(.secondaryColor)
                                    }.foregroundColor(.secondaryColor)
                                }
                                
                                /// Selection Indicator
                                Circle().frame(width: 12, height: 12, alignment: .center).opacity(0)
                            }
                        }
                        
                    }.padding(.horizontal, 28).frame(width: geometry.size.width)
                    
                    VStack {
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Start").font(.system(size: 22, weight: .heavy, design: .serif)).foregroundColor(.mainColor).textCase(.uppercase)
                        }
                        Spacer().frame(height: 30)
                    }
                } // end ZStack
                
                // MARK: - TIMER IS RUNNING
            } else {
                
                ZStack {
                    
                    VStack(alignment: .center) {
                        
                        /// Sky animation
                        VStack {
                            
                            if colorScheme == .light {
                                /// Light mode
                                ZStack{
                                    /// CLOUDS
                                    Image(systemName: "cloud.fill")
                                        .font(.system(size: 85, weight: .regular))
                                        .foregroundColor(.shapesColor)
                                        .offset(x: -100, y: -80)
                                    
                                    Image(systemName: "cloud.fill")
                                        .font(.system(size: 85, weight: .regular))
                                        .foregroundColor(.shapesColor)
                                        .offset(x: 80)
                                    
                                    /// SUN
                                    Image(systemName: "sun.max.fill")
                                        .font(.system(size: 120, weight: .regular))
                                        .foregroundColor(.shapesColor)
                                        .offset( x: -120, y: 100)
                                }
                                
                            } else {
                                
                                /// Dark mode
                                ZStack{
                                    /// STARS
                                    Circle()
                                        .fill(Color.mainColor)
                                        .frame(width: 5, height: 5)
                                        .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                                    
                                    Circle()
                                        .fill(Color.mainColor)
                                        .frame(width: 5, height: 5)
                                        .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                                        .offset(x: -90.0, y: -80.0)
                                    
                                    Circle()
                                        .fill(Color.mainColor)
                                        .frame(width: 5, height: 5)
                                        .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                                        .offset(x: -50.0, y: -120.0)
                                    
                                    Circle()
                                        .fill(Color.mainColor)
                                        .frame(width: 5, height: 5)
                                        .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                                        .offset(x: 100.0, y: 50.0)
                                    
                                    /// SUN
                                    Image(systemName: "moon.stars.fill")
                                        .font(.system(size: 120, weight: .regular))
                                        .foregroundColor(.mainColor)
                                        .offset( x: -120, y: 100)
                                        .shadow(color: .mainColor, radius: 18.0, x: 0, y: 0)
                                }
                            }

                        }
                        .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .center)
                        .ignoresSafeArea()
                        
                        /// Running timer
                        Text("\(timeString(time: TimeInterval(timeRemaining)))")
                            .font(.system(size: 80, weight: .heavy, design: .serif))
                            .foregroundColor(.mainColor)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                } else if timeRemaining == 0 {
                                    isStoped = true
                                    playSound(sound: "bell", type: "wav")
                                }
                            }
                            .lineLimit(1)
                            .padding(.horizontal, 28)
                    }
                    .frame(width: geometry.size.width)
                    
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
