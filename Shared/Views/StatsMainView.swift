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
                HStack(alignment: .center, spacing: 12.0){
                    
                    /// Streak
                    HStack(alignment: .bottom, spacing: 5.0){
                        Image(systemName: "calendar")
                            .font(.system(size: 17))
                            .foregroundColor(.elementSecondary)
                            .offset(y: -2)
                        Text(streak)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .offset(y: 2)
                        Text(streakUnit)
                            .offset(x: -2)
                    }.padding(.horizontal, 10)
                    
                    Divider()
                    
                    /// Total hours
                    HStack(alignment: .bottom, spacing: 5.0){
                        Image(systemName: "hourglass")
                            .font(.system(size: 17))
                            .foregroundColor(.elementSecondary)
                            .offset(y: -2)
                        Text(total)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .offset(y: 2)
                        Text(totalUnit)
                            .offset(x: -2)
                    }.padding(.horizontal, 10)
                    
                    Divider()
                    
                    /// Average
                    HStack(alignment: .bottom, spacing: 5.0){
                        Image(systemName: "stopwatch")
                            .font(.system(size: 17))
                            .foregroundColor(.elementSecondary)
                            .offset(y: -2)
                        Text(average)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .offset(y: 2)
                        Text(averageUnit)
                            .offset(x: -2)
                    }.padding(.horizontal, 10)
                }
                .frame(width: geo.size.width - 32)
                .cornerRadius(10)
                .padding()
            }
        }.frame(height: 82).padding(.horizontal)
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
