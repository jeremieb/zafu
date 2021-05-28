//
//  ListSessionCustomView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//
//  STACKOVERFLOW: https://stackoverflow.com/questions/58886568/swiftui-passing-data-from-view-to-modal-wont-update-correctly

import SwiftUI

struct SmallSessionCellView: View {
    
    @StateObject var data = TimerData()
    
    @State var showDetail = false
    @State var selectedSession: CustomSession? = nil
    
    /// Placeholder sessions
    private var mySessions = [
        CustomSession(title: "First Session", duration: 5, icon: "flame"),
        CustomSession(title: "Second Session", duration: 20, icon: "leaf"),
        CustomSession(title: "Third Session", duration: 90),
        CustomSession(title: "Fourth Session", duration: 3600)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10.0){
                ForEach(mySessions){ session in
                    SquareCellsView(title: session.title, duration: session.duration, icon: session.icon)
                        .onTapGesture {
                            self.selectedSession = session
                        }
                }
            }
            .padding(.horizontal)
            .sheet(item: self.$selectedSession){ session in
                SessionDetailView(title: session.title, icon: session.icon ?? "drop", duration: session.duration).modifier(DisableModalDismiss(disabled: true)).environmentObject(data)
            }
        }.padding(.top, 10)
    }
}

struct SquareCellsView: View {
    
    var title = "Session title"
    var duration = 5
    var icon: String?
  
    var body: some View {
        
        /// Content
        VStack {
            VStack(alignment: .leading){
                HStack {
                    Text(String(duration) + " min")
                        .font(.caption)
                        .foregroundColor(.textPurple)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.textPurple, lineWidth: 1)
                        )
                        .lineLimit(1)
                    Spacer()
                    
                    // if we have a icon
                    if ((icon?.isEmpty) != nil) {
                        Image(systemName: icon ?? "")
                            .font(.system(size: 20))
                            .foregroundColor(Color.textPurple)
                            .opacity(0.5)
                    }
                }
                Spacer()
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.textPurple)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding()
            Spacer()
        }
        .background(Color.topSession.opacity(0.4))
        .frame(width: 150, height: 150)
        .cornerRadius(20)
    }
}

struct ListSessionCustomView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SquareCellsView(title: "Test", duration: 5, icon: "leaf")
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            SquareCellsView()
                .preferredColorScheme(.dark)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            ZStack {
                BackgroundView()
                SmallSessionCellView()
            }
        }
    }
}


