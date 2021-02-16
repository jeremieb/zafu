//
//  TimerView.swift
//  Zafu
//
//  Created by Jeremie Berduck on 08/01/2021.
//

import SwiftUI

struct TimerView: View {

    @State var selectedButton = 0
    @State var timeRemaining = 0
    
    @EnvironmentObject var myTimer: TimerViewModel
    
    @AppStorage("firstTimer") var firstTimer: Int = 900
    @AppStorage("secondTimer") var secondTimer: Int = 1200
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        GeometryReader{ geometry in
            
            // MARK: - TIMER IS NOT RUNNING
            
            if !myTimer.isStarted { /// Timer is not running
                
                ZStack {

                    VStack(alignment: .center) {
                        
                        /// Define a spacer with the height of half of the screen
                        Spacer().frame(height: geometry.size.height / 6)
                        
                        HStack {
                            
                            /// 15 minutes
                            VStack {
                                Button(action: { selectedButton = 0 }) {
                                    VStack(alignment: .center) {
                                        Text("\(Int(firstTimer) / 60 % 60)").font(.system(size: 80, weight: .heavy, design: .serif))
                                        Text("minutes").font(.system(size: 17, weight: .regular, design: .serif))
                                    }
                                    .foregroundColor(selectedButton == 0 ? .mainColor : .secondaryColor)
                                }
                                /// Selection Indicator
                                Circle()
                                    .frame(width: 12, height: 12, alignment: .center)
                                    .opacity(selectedButton == 0 ? 1 : 0 )
                                    .foregroundColor(.mainColor)
                            }
                            
                            Spacer().frame(width: geometry.size.width / 3.2)
                            
                            /// 20 minutes
                            VStack {
                                Button(action: { selectedButton = 1 }) {
                                    VStack(alignment: .center) {
                                        Text("\(Int(secondTimer) / 60 % 60)").font(.system(size: 80, weight: .heavy, design: .serif))
                                        Text("minutes").font(.system(size: 17, weight: .regular, design: .serif))
                                    }
                                    .foregroundColor(selectedButton == 1 ? .mainColor : .secondaryColor)
                                }
                                /// Selection Indicator
                                Circle()
                                    .frame(width: 12, height: 12, alignment: .center)
                                    .opacity(selectedButton == 1 ? 1 : 0 )
                                    .foregroundColor(.mainColor)
                            }
                        }
                        
                    }.padding(.horizontal, 28).frame(width: geometry.size.width)
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            withAnimation(){
                                startTimer(timer: selectedButton == 0 ? firstTimer : secondTimer)
                                myTimer.isStarted = true
                                playSound(sound: "bell", type: "wav")
                            }
                        }) {
                            Text("Start").font(.system(size: 22, weight: .heavy, design: .serif)).foregroundColor(.mainColor).textCase(.uppercase)
                        }
                        Spacer().frame(height: 30)
                    }
                } // end ZStack
                
                // MARK: - TIMER IS RUNNING
            } else {
                
                ZStack {
                    
                    VStack(alignment: .center) {

                        SkyView()
                        
                        /// Running timer
                        Text("\(timeString(time: TimeInterval(timeRemaining)))")
                            .kerning(2)
                            .font(.system(size: 70, weight: .heavy, design: .serif))
                            .foregroundColor(.mainColor)
                            .frame(width: geometry.size.width, alignment: .center)
                            .multilineTextAlignment(.center)
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                } else if timeRemaining == 0 {
                                    myTimer.isStarted = false
                                    playSound(sound: "bell", type: "wav")
                                }
                            }
                            .lineLimit(1)
                            .padding(.horizontal, 28)
                            .frame(width: geometry.size.width)
                            .fixedSize()
                        
                        VStack {
                            Spacer()
                            Button(action: {
                                withAnimation(){
                                    myTimer.isStarted = false
                                    timeRemaining = 0
                                }
                            }) {
                                Text("Stop").font(.system(size: 22, weight: .heavy, design: .serif)).foregroundColor(.mainColor).textCase(.uppercase)
                            }
                            Spacer().frame(height: 30)
                        }
                    }
                    .frame(width: geometry.size.width, alignment: .center)
                }
            }
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let hour = Int(time) / 3600
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60
        
        // return formated string
        return String(format: "%02i:%02i:%02i", hour, minute, second)
    }
    
    func startTimer(timer: Int) {
        timeRemaining = timer
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(TimerViewModel())
    }
}
