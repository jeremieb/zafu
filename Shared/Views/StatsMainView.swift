//
//  StatsMainView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 22/05/2021.
//

import SwiftUI

struct StatsMainView: View {
    
    /// Total days in a row
    var streak: String = "12"
    var streakUnit: String = "d"
    
    /// Total hours
    var total: String = "4,2"
    var totalUnit: String = "h"
    
    /// Average session
    var average: String = "19"
    var averageUnit: String = "m"
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 8){
            
            /// Streak
            StatItem(number: streak, unit: streakUnit)
            
            Divider().background(Color.elementSecondary).opacity(0.6)
            
            /// Total hours
            StatItem(number: total, unit: totalUnit)
            
            Divider().background(Color.elementSecondary).opacity(0.6)
            
            /// Average
            StatItem(number: average, unit: averageUnit)
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 60)
        .background(Color(UIColor.systemBackground).opacity(0.4))
        .cornerRadius(30)
        .padding(.horizontal)
    }
}

struct StatItem: View {
    
    var number: String
    var unit: String
    
    var body: some View{
        HStack(spacing: 5.0){
            Image(systemName: "stopwatch")
                .foregroundColor(.elementSecondary)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Text(number)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Text(unit)
                .font(.footnote)
                .offset(x: -2, y: 4)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }.frame(width: (UIScreen.main.bounds.size.width - 72) / 3, alignment: .center)
    }
}

struct StatsMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                BackgroundView().frame(height: 80)
                StatsMainView()
            }
            .previewDevice("iPhone 12 Pro")
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("iPhone 12 Pro")
            ZStack {
                BackgroundView().frame(height: 80)
                StatsMainView()
            }
            .previewDevice("iPhone 11 Pro")
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("iPhone 11 Pro")
            ZStack {
                BackgroundView().frame(height: 80)
                StatsMainView()
            }
            .previewDevice("iPhone 8")
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("iPhone 8")
            ZStack {
                BackgroundView().frame(height: 80)
                StatsMainView()
            }
            .previewDevice("iPhone SE (2nd generation)")
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("iPhone SE (2nd generation)")
        }
    }
}
