//
//  ListSessionCustomView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//

import SwiftUI

struct LargeSessionCellView: View {
    
    /// Placeholder sessions
    private var sessions = [
        LocalSession(title: "First Session", duration: 15, description: "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.", color: Color.mainOrange),
        LocalSession(title: "Second Session Big Title", duration: 20, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", color: Color.mainOrange),
        LocalSession(title: "Third Session", duration: 16, description: "Cras justo odio, dapibus ac facilisis in, egestas eget quam.", color: Color.mainOrange)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10.0){
                ForEach(sessions){ featured in
                    LargeCellView(title: featured.title, duration: featured.duration, description: featured.description)
                }
            }.padding(.horizontal)
        }.frame(width: UIScreen.main.bounds.width).padding(.top, 10)
    }
}

struct LargeCellView: View {
    
    var title = "Session title"
    var duration = 5
    var description = "Cras justo odio, dapibus ac facilisis in, egestas eget quam."
    
    let gradientOneColors = Gradient(colors: [Color.gradient1Start, Color.gradient1End])
    var gradientOne: RadialGradient {
        return RadialGradient(gradient: gradientOneColors, center: .topLeading, startRadius: 0, endRadius: 160)
    }
    
    var body: some View {
        
        /// Content
        HStack {
            VStack(alignment: .leading){
                Text(String(duration) + " min")
                    .font(.caption)
                    .foregroundColor(.mainPurple)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.mainPurple, lineWidth: 1)
                    )
                    .lineLimit(1)
                Spacer()
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.mainPurple)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.mainPurple)
                    .lineLimit(2)
            }
            .padding()
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(gradientOne).opacity(0.5))
                .frame(width: 235, height: 150)
    }
}

struct ListSessionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LargeSessionCellView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            LargeCellView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            LargeCellView()
                .preferredColorScheme(.dark)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
        }
    }
}


