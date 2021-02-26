//
//  SettingsTimerSelectionView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/02/2021.
//

import SwiftUI

struct SettingsTimerSelectionView: View {
    
    @State var timePickerOne = false
    @State var timePickerTwo = false
    
    /// Timer selection value
    private var timeAvailable = [300, 600, 900, 1200, 1800, 2400, 2700, 3000, 3600, 4500, 5400, 7200]
    
    /// We're storing the timer value
    @AppStorage("firstTimer") var firstTimer: Int = 900
    @AppStorage("secondTimer") var secondTimer: Int = 1200
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            HStack {
                
                /// First Button
                Button(action: {
                    withAnimation {
                        timePickerOne.toggle()
                        if timePickerTwo {
                            timePickerTwo.toggle()
                        }
                    }
                }) {
                    ButtonTimerSelection(label: "\(Int(firstTimer) / 60 % 240)")
                }
                
                Spacer()
                
                /// Second Button
                Button(action: {
                    withAnimation {
                        timePickerTwo.toggle()
                        if timePickerOne {
                            timePickerOne.toggle()
                        }
                    }
                }) {
                    ButtonTimerSelection(label: "\(Int(secondTimer) / 60 % 240)")
                }
                
            }
            
            if timePickerOne {
                Picker(selection: $firstTimer, label: EmptyView(), content: {
                    ForEach(timeAvailable, id: \.self, content: { time in
                        Text("\(Int(time) / 60 % 240) min")
                    })
                })
            }
            
            if timePickerTwo {
                Picker(selection: $secondTimer, label: EmptyView(), content: {
                    ForEach(timeAvailable, id: \.self, content: { time in
                        Text("\(Int(time) / 60 % 240) min")
                    })
                })
            }
            
            if !timePickerOne && !timePickerTwo {
                Text("Tap the buttons above to set your meditation time.")
                    .font(.footnote)
                    .foregroundColor(.mainColor)
                    .opacity(0.6)
            }
            
        }.padding(.horizontal)
        Spacer().frame(height: 16)
    }
}

struct ButtonTimerSelection: View {
    
    var label: String = "tap to select"
    
    var body: some View {
        
        ZStack {
            
            /// Background color
            Color.mainColor
                .opacity(0.15)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 10.0) {
                Image(systemName: "timer")
                    .font(.system(size: 24))
                Text(label + " minutes")
                    .font(.system(size: 17, weight: .semibold, design: .serif))
            }
            .padding()
            .foregroundColor(.mainColor)
            
        }
        .frame(width: UIScreen.main.bounds.width / 2.3)
        
    }
}

struct SettingsTimerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTimerSelectionView()
    }
}
