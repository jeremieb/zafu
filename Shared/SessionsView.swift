//
//  SessionsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct SessionsView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.mainPurple)]
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(0...10, id: \.self){ _ in
                        CellText()
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }
            .navigationTitle("My Sessions")
            .background(BackgroundView())
        }
    }
}

struct CellText: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var colors = [Color.mainOrange, Color.mainSky, Color.mainDarkPink, Color.mainBlue, Color.mainPink]
    var duration = [5,10,25,30,45]
    var title = "Title"
    var description = [
        "Cras justo odio, dapibus ac facilisis in, egestas eget quam.",
        "Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        "Morbi leo risus, porta ac consectetur ac, vestibulum at eros.",
        "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."
    ]
    
    var colorComputed: Color {
        return colors.randomElement() ?? Color.mainOrange
    }
    
    var durationComputed: Int {
        return duration.randomElement() ?? 5
    }
    
    var descriptionComputed: String {
        return description.randomElement() ?? ""
    }
    
    var body: some View {
        /// Content
        HStack {
            VStack(alignment: .leading){
                Text(String(durationComputed) + " min")
                    .font(.caption)
                    .foregroundColor(colorComputed)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(colorComputed, lineWidth: 1)
                    )
                    .lineLimit(1)
                Spacer()
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(colorComputed)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(descriptionComputed)
                    .font(.footnote)
                    .foregroundColor(colorComputed)
                    .lineLimit(2)
            }
            .padding()
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(colorComputed).opacity(colorScheme == .dark ? 0.1 : 0.8))
        .frame(width: UIScreen.main.bounds.size.width - 32, height: 150)
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
