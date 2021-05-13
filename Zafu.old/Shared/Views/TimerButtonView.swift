//
//  TimerButtonView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct TimerButtonView: View {

    var time: Int
    var isSelected: Bool
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("\(Int(time) / 60 % 240)")
                .font(.system(size: 80, weight: .heavy, design: .serif))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text("minutes").font(.system(size: 17, weight: .regular, design: .serif))
        }
        .foregroundColor(isSelected == true ? .mainColor : .secondaryColor)
    }
}

