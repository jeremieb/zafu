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
        Session(title: "First Session", duration: 15, description: "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."),
        Session(title: "Second Session Big Title", duration: 20, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        Session(title: "Third Session", duration: 16, description: "Cras justo odio, dapibus ac facilisis in, egestas eget quam.")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10.0){
                ForEach(sessions){ featured in
                    LargeCellView(title: featured.title, duration: featured.duration, description: featured.description)
                }
            }.padding(.horizontal)
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct LargeCellView: View {
    
    var title = "Session title"
    var duration = 5
    var description = "Cras justo odio, dapibus ac facilisis in, egestas eget quam."
    
    var body: some View {
        
        /// Content
        HStack {
            VStack(alignment: .leading){
                Text(String(duration) + " min")
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
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.elementSecondary)
                    .lineLimit(2)
            }
            .padding()
            Spacer()
        }
        .background(Color(UIColor.systemBackground).opacity(0.4))
        .frame(width: 235, height: 150)
        .cornerRadius(20)
        
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


