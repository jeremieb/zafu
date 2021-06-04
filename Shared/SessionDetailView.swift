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

            VStack(spacing: 0) {
                
                Spacer().frame(height: 80)
                
                /// Title
                Text("\(Image(systemName: session.icon)) ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.mainPurple)
                    + Text(session.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.mainPurple)
                
                QuoteView().padding(.top, 50).padding(.bottom, 0).foregroundColor(.mainPurple)
                
                ZStack {
                    Circle().stroke(Color(UIColor.systemBackground), lineWidth: 8).frame(width: 230).opacity(0.6)
                    Circle().stroke(Color(UIColor.systemBackground), lineWidth: 2).frame(width: 210).opacity(0.6)
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
                            Image("pauseButton")
                        } else {
                            Image("playButton")
                        }
                    }
                }.frame(height: 230).padding(.top, 50)
                
                /// Timing display
                SessionTimingDisplayView(isStarted: data.sessionHasStarted, duration: session.duration, interval: session.interval)
                    .environmentObject(data)
 
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

// MARK: - Session Timing Display View
struct SessionTimingDisplayView: View {
    
    /// Models
    @EnvironmentObject var data: TimerData
    
    var isStarted: Bool
    var duration: Int16
    var interval: Int16
    
    var body: some View{
        if isStarted {
            VStack(alignment: .center) {
                Text(Double(data.selectedTime).asString(style: .positional))
                    .font(.title)
                    .fontWeight(.heavy)
                if interval > 0 {
                    HStack(spacing: 0) {
                        Label(Double(interval).asString(style: .positional), systemImage: "bell")
                        if interval <= 60 {
                            Text(" seconds")
                        } else if interval >= 60 && interval <= 3599 {
                            Text(" minutes")
                        } else {
                            Text(" hours")
                        }
                    }
                    .font(.footnote)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(30)
                    .foregroundColor(.mainPurple)
                    .padding(.top, 16)
                }
            }.foregroundColor(.mainPurple).padding(.top, 50)
        } else {
            /// Duration label
            HStack(alignment: .firstTextBaseline) {
                Text(Double(duration).asString(style: .positional))
                    .font(.title)
                    .fontWeight(.heavy)
                if duration <= 60 {
                    Text("seconds").fontWeight(.semibold)
                } else if duration >= 60 && duration <= 3599 {
                    Text("minutes").fontWeight(.semibold)
                } else {
                    Text("hours").fontWeight(.semibold)
                }
            }.foregroundColor(.mainPurple).padding(.top, 50)
            if interval > 0 {
                HStack(spacing: 0) {
                    Label(Double(interval).asString(style: .positional), systemImage: "bell")
                    if interval <= 60 {
                        Text(" seconds")
                    } else if interval >= 60 && interval <= 3599 {
                        Text(" minutes")
                    } else {
                        Text(" hours")
                    }
                }
                .font(.footnote)
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(30)
                .foregroundColor(.mainPurple)
                .padding(.top, 30)
            }
        }
    }
}

// MARK: - Circular Gradient Button
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

// MARK: - Session Top Tools
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

//struct SessionDetailView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        
//        var dataController = DataController().createSampleData()
//
//        Group {
//            SessionDetailView(session: ).environmentObject(TimerData())
//            SessionDetailView().preferredColorScheme(.dark).environmentObject(TimerData())
//        }
//    }
//}
