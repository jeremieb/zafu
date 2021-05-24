//
//  SessionDetailView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/05/2021.
//


import SwiftUI

struct SessionDetailView: View {
    
    var title: String = "Session Title"
    var icon: String = "drop"
    var duration: Int = 5
    
    var body: some View {
        VStack{
            SessionTopTools()
            
            ZStack {
                
                VStack {
                    Text("\(Image(systemName: icon))")
                        .font(.system(size: 310))
                        .fontWeight(.ultraLight)
                        .foregroundColor(.myPurple)
                        .opacity(0.2)
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    
                    /// Title
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 100)
                    
                    QuoteView()
                        .padding(.top, 50)

                    Spacer().frame(height: 120)
                    
                    /// Duration label
                    Text(String(duration) + " min")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.myPurple)
                    
                    Button(action: {
                        AudioPlayer.playSecondarySound(soundFile: "metal_gong.wav")
                    }) {
                        Image("playButton")
                    }
                }
            }
            
            Spacer()
        }
        .background(BackgroundView().opacity(0.4))
    }
}

struct SessionTopTools: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack{
            
            Button(action: {
                AudioPlayer.stopSecondarySound()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Edit")
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .frame(width: UIScreen.main.bounds.size.width)
    }
    
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView()
    }
}
