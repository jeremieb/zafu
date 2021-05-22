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
        ZStack {
            
            /// Background color
            Color(UIColor.systemBackground)
                .opacity(0.4)
                .cornerRadius(10)
            
            GeometryReader { geo in
                HStack(alignment: .center, spacing: 10.0){
                    
                    /// Streak
                    HStack(spacing: 5.0){
                        Image(systemName: "calendar")
                            .foregroundColor(.elementSecondary)
                            .minimumScaleFactor(0.5)
                        Text(streak)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.5)
                        Text(streakUnit)
                            .font(.footnote)
                            .offset(x: -2, y: 4)
                            .minimumScaleFactor(0.5)
                    }.padding(.horizontal, 10)
                    
                    Divider()
                    
                    /// Total hours
                    HStack(spacing: 5.0){
                        Image(systemName: "hourglass")
                            .foregroundColor(.elementSecondary)
                            .minimumScaleFactor(0.5)
                        Text(total)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.5)
                        Text(totalUnit)
                            .font(.footnote)
                            .offset(x: -2, y: 4)
                            .minimumScaleFactor(0.5)
                    }.padding(.horizontal, 10)
                    
                    Divider()
                    
                    /// Average
                    HStack(spacing: 5.0){
                        Image(systemName: "stopwatch")
                            .foregroundColor(.elementSecondary)
                            .minimumScaleFactor(0.5)
                        Text(average)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.5)
                        Text(averageUnit)
                            .font(.footnote)
                            .offset(x: -2, y: 4)
                            .minimumScaleFactor(0.5)
                    }.padding(.horizontal, 10)
                }
                .frame(width: geo.size.width - 32)
                .cornerRadius(10)
                .padding()
            }
        }.frame(height: 70).padding(.horizontal)
    }
}

struct StatsMainView_Previews: PreviewProvider {
    static var previews: some View {
        StatsMainView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
