//
//  SessionDetailView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/05/2021.
//

import SwiftUI

struct SessionDetailView: View {
    
    /// Models
    @EnvironmentObject var data: TimerData
    @ObservedObject var session: Sessions
    
    /// Dark or light mode?
    @Environment(\.colorScheme) var colorScheme
    
    /// Animation when session got started
    @State private var isAnimated = false
    
    /// Alert sounds selected
    @AppStorage("alertFile", store: UserDefaults(suiteName: "com.jeremieberduck.zafu")) var alertFile: Int = 1
    /// Computed alert file value
    private var alertFileStored: String {
        return bellFiles[alertFile].file
    }

    var body: some View {
        ZStack{
          
            Color(session.color).opacity(colorScheme == .dark ? 0.2 : 0.3).ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 50)
                Text("\(Image(systemName: session.icon))")
                    .font(.system(size: 140))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.mainPurple)
                    .opacity(0.2)
                Spacer()
            }
            
            VStack {
                
                /// Title
                Text(session.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.mainPurple)
                    .padding(.top, 100)
                    .lineLimit(4)
                
                QuoteView().padding(.top, 20).foregroundColor(.mainPurple)
                
                Spacer().frame(height: 120)
                
                if data.sessionHasStarted {
                    VStack {
                        Text(Double(data.selectedTime).asString(style: .positional))
                            .font(.system(size: 42))
                            .fontWeight(.heavy)
                        if data.selectedTime <= 60 {
                            Text("seconds remain").fontWeight(.semibold)
                        } else if data.selectedTime >= 60 && data.selectedTime <= 3599 {
                            Text("minutes remain").fontWeight(.semibold)
                        } else {
                            Text("hours remain").fontWeight(.semibold)
                        }
                        if session.interval > 0 {
                            HStack(spacing: 0) {
                                Text("Alert me after: " + Double(session.interval).asString(style: .positional))
                                if session.interval <= 60 {
                                    Text(" seconds")
                                } else if session.interval >= 60 && session.interval <= 3599 {
                                    Text(" minutes")
                                } else {
                                    Text(" hours")
                                }
                            }.font(.footnote).padding(.vertical, 20)
                        }
                    }.foregroundColor(.mainPurple)
                } else {
                    /// Duration label
                    VStack {
                        Text(Double(session.duration).asString(style: .positional))
                            .font(.system(size: 42))
                            .fontWeight(.heavy)
                        if session.duration <= 60 {
                            Text("seconds").fontWeight(.semibold)
                        } else if session.duration >= 60 && session.duration <= 3599 {
                            Text("minutes").fontWeight(.semibold)
                        } else {
                            Text("hours").fontWeight(.semibold)
                        }
                        if session.interval > 0 {
                            HStack(spacing: 0) {
                                Text("Alert me after: " + Double(session.interval).asString(style: .positional))
                                if session.interval <= 60 {
                                    Text(" seconds")
                                } else if session.interval >= 60 && session.interval <= 3599 {
                                    Text(" minutes")
                                } else {
                                    Text(" hours")
                                }
                            }.font(.footnote).padding(.vertical, 20)
                        }
                    }.foregroundColor(.mainPurple)
                }
                
                ZStack {
                    if data.sessionHasStarted {
                        CircularGradientButton(secondColor: Color(session.color))
                            .rotationEffect(Angle.degrees(isAnimated ? 360 : 0 ))
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    } else {
                        CircularGradientButton(secondColor: Color(session.color))
                    }
                    Button(action: {
                        AudioPlayer.playSecondarySound(soundFile: alertFileStored)
                        withAnimation(.linear(duration: 0.450)) {
                            data.time = Int(session.duration)
                            data.selectedTime = Int(session.duration)
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
                    AudioPlayer.playSecondarySound(soundFile: alertFileStored)
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


/// MARK: - Circular Gradient Button
struct CircularGradientButton: View {
    
    var secondColor: Color

    var body: some View {
        
        let gradient = AngularGradient(
            gradient: Gradient(colors: [Color.myPink, Color.myPink.opacity(0)]),
            center: .center,
            startAngle: .degrees(320),
            endAngle: .degrees(0))
        
        ZStack {
            Circle().stroke(secondColor.opacity(0), lineWidth: 10).frame(width: 84, height: 84)
            
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

/// MARK: - Session Top Tools
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
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .frame(width: UIScreen.main.bounds.size.width)
    } 
}

/// MARK: - Top Curve
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

//struct SessionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            SessionDetailView().environmentObject(TimerData())
//            SessionDetailView().preferredColorScheme(.dark).environmentObject(TimerData())
//        }
//    }
//}
