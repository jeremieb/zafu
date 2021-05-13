//
//  AchievementsSectionView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct AchievementsSectionView: View {
    
    var weeklyAverage: Double
    var monthlyAverage: Double
    
    var body: some View {

        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .top) {
                
                /// Weekly
                AchievementDataView(isWeekly: true, data: weeklyAverage)
                
                Divider()
                    .frame(height: 60)
                    .background(Color.mainColor)
                    .offset(y: 30)
                    .opacity(0.3)
                
                /// Monthly
                AchievementDataView(data: monthlyAverage)
            }
        }
    }
}

struct AchievementDataView: View {
    
    var isWeekly: Bool = false
    var data: Double
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            /// Title
            if isWeekly {
                Text("Weekly average")
                    .font(.system(size: 13, weight: .heavy, design: .serif))
            } else {
                Text("Monthly average")
                    .font(.system(size: 13, weight: .heavy, design: .serif))
            }
            
            /// Data
            Text("\(data, specifier: "%.1f")")
                .font(.system(size: 40, weight: .heavy, design: .serif))
            
            /// Units
            Text("minutes")
                .font(.system(size: 13, weight: .regular, design: .serif))
        }
        .foregroundColor(.mainColor)
        .padding()
    }
    
}

struct AchievementsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsSectionView(weeklyAverage: 2.5, monthlyAverage: 3.6)
    }
}
