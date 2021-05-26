//
//  SessionDetailView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/05/2021.
//

import SwiftUI

struct SessionDetailView: View {
    
    @EnvironmentObject var data: TimerData
    
    @State var isAnimated = false
    
    var title: String = "Session Title"
    var icon: String = "drop"
    var duration: Int = 5
    
    var body: some View {
        ZStack{
            
            VStack {
                TopCurve()
                    .fill(Color.topSession)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2.5)
                Spacer()
            }.ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 50)
                Text("\(Image(systemName: icon))")
                    .font(.system(size: 140))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.textPurple)
                    .opacity(0.2)
                Spacer()
            }
            
            VStack {
                
                /// Title
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.textPurple)
                    .padding(.top, 100)
                    .lineLimit(4)
                
                QuoteView().padding(.top, 20).foregroundColor(.textPurple)
                
                Spacer().frame(height: 120)
                
                
                if data.sessionHasStarted {
                    VStack {
                        Text(String(data.selectedTime))
                            .font(.system(size: 42))
                            .fontWeight(.heavy)
                        Text("remain")
                    }.foregroundColor(.textPurple)
                } else {
                    /// Duration label
                    VStack {
                        Text(String(duration))
                            .font(.system(size: 42))
                            .fontWeight(.heavy)
                        Text("min")
                            .fontWeight(.semibold)
                    }.foregroundColor(.textPurple)
                }
                
                ZStack {
                    if data.sessionHasStarted {
                        CircularGradientButton()
                            .rotationEffect(Angle.degrees(isAnimated ? 360 : 0 ))
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    } else {
                        CircularGradientButton()
                    }
                    Button(action: {
                        AudioPlayer.playSecondarySound(soundFile: "metal_gong.wav")
                        withAnimation(.linear(duration: 0.450)) {
                            data.time = duration
                            data.selectedTime = duration
                            data.sessionHasStarted.toggle()
                        }
                        isAnimated = true
                    }) {
                        if data.sessionHasStarted {
                            Image("pauseButton").offset(y: 7)
                        } else {
                            Image("playButton").offset(y: 7)
                        }
                    }
                }
                Spacer()
                
            }
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
                data.selectedTime -= 1
                
                if data.selectedTime == 0 {
                    data.stopSession()
                    isAnimated = false
                }
            })
            
            VStack {
                if data.sessionHasStarted {
                    SessionTopTools(isInactive: true)
                } else {
                    SessionTopTools()
                }
                Spacer()
            }
            
        }
    }
}

struct CircularGradientButton: View {
    
    private let gradient = AngularGradient(
        gradient: Gradient(colors: [Color.myPink, Color(UIColor.systemBackground)]),
        center: .center,
        startAngle: .degrees(320),
        endAngle: .degrees(0))
    
    var body: some View {
        ZStack {
            Circle().stroke(Color(UIColor.systemBackground), lineWidth: 10).frame(width: 84, height: 84)
            
            Circle()
                .trim(from: 0, to: CGFloat(0.79))
                .stroke(gradient, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 84, height: 84)
                .overlay(
                    Circle().trim(from: 0, to: CGFloat(0.80))
                        .rotation(Angle.degrees(-9))
                        .stroke(gradient, style: StrokeStyle(lineWidth: 10, lineCap: .butt)))
            
        }.rotationEffect(Angle(degrees: -20))
    }
    
}

struct SessionTopTools: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var isInactive: Bool = false
    
    var body: some View {
        HStack(alignment: .center){
            
            /// Close modal view
            Button(action: {
                AudioPlayer.stopSecondarySound()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
            }.disabled(isInactive)
            
            Spacer()
            
            /// AirPlay
            AirPlayView().frame(width: 22, height: 22)
            
            /// Edit current session
            Button(action: {
                
            }) {
                Image(systemName: "square.and.pencil")
            }.padding(.horizontal, 10).disabled(true)
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .frame(width: UIScreen.main.bounds.size.width)
    }
    
}

struct TopCurve: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY + 100))
        
        return path
    }
    
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SessionDetailView().environmentObject(TimerData())
            SessionDetailView().preferredColorScheme(.dark).environmentObject(TimerData())
        }
    }
}
