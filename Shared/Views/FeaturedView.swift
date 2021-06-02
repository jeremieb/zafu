//
//  FeaturedView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 02/06/2021.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: "Featured").padding(.top, 30).foregroundColor(.elementSecondary)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10.0){
                    ForEach(sessions){ featured in
                        FeaturedCellView(featuredSession: featured)
                    }
                }.padding(.horizontal)
            }.frame(width: UIScreen.main.bounds.width).padding(.top, 10)
        }
    }
}

// MARK: - Featured Cell Views
struct FeaturedCellView: View {
    
    let gradientOneColors = Gradient(colors: [Color.gradient1Start, Color.gradient1End])
    var gradientOne: RadialGradient {
        return RadialGradient(gradient: gradientOneColors, center: .topLeading, startRadius: 0, endRadius: 160)
    }
    
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
                .fill(gradientOne).opacity(0.5))
                .frame(width: 235, height: 150)
    }
    
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
