//
//  MeditationView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct MeditationView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.mainPurple)]
    }
 
    var body: some View {

        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(sessions){ featured in
                        CellText(featuredSession: featured)
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }
            .navigationTitle("Meditations")
            .background(BackgroundView())
        }
    }
}

struct CellText: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var featuredSession: LocalFeaturedSession

    var body: some View {
        /// Content
        HStack {
            VStack(alignment: .leading){
                Text(String(featuredSession.duration) + " min")
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
                Text(featuredSession.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.mainPurple)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(featuredSession.description)
                    .font(.footnote)
                    .foregroundColor(.mainPurple)
                    .lineLimit(2)
            }
            .padding()
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(featuredSession.color).opacity(colorScheme == .dark ? 0.1 : 0.8))
        .frame(width: UIScreen.main.bounds.size.width - 32, height: 150)
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
