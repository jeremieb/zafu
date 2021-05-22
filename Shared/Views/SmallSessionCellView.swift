//
//  ListSessionCustomView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//

import SwiftUI

struct SmallSessionCellView: View {
    
    /// Placeholder sessions
    private var mySessions = [
        CustomSession(title: "First Session", duration: "5 min", icon: "flame"),
        CustomSession(title: "Second Session", duration: "20 min", icon: "leaf"),
        CustomSession(title: "Third Session", duration: "15 min"),
        CustomSession(title: "Fourth Session", duration: "25 min")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(mySessions){ session in
                    SquareCellsView(title: session.title, duration: session.duration, icon: session.icon)
                }
            }.padding(.horizontal)
        }
    }
}

struct SquareCellsView: View {
    
    var title = "Session title"
    var duration = "5 min"
    var icon: String?
    var iconColor: UIColor {
        return UIColor.random(from: [.systemBlue, .systemPink, .systemGreen, .systemTeal, .systemPurple]) ?? UIColor.systemBlue
    }
    
    var body: some View {
        ZStack {
            
            /// Background color
            Color(UIColor.systemBackground)
                .opacity(0.4)
            
            /// Content
            HStack {
                VStack(alignment: .leading){
                    HStack {
                        Text(duration)
                            .font(.caption)
                            .foregroundColor(.elementSecondary)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.elementSecondary, lineWidth: 1)
                             )
                            .lineLimit(1)
                        Spacer()
                        
                        // if we have a icon
                        if ((icon?.isEmpty) != nil) {
                            Image(systemName: icon ?? "")
                                .font(.system(size: 20))
                                .foregroundColor(Color(iconColor ))
                                .opacity(0.5)
                        }
                    }
                    Spacer()
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                .padding()
                Spacer()
            }
        }
        .frame(width: 150, height: 150)
        .cornerRadius(10)
    }
}

struct ListSessionCustomView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SquareCellsView(title: "Test", duration: "5 min", icon: "leaf")
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            SquareCellsView()
                .preferredColorScheme(.dark)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            SmallSessionCellView()
        }
    }
}


