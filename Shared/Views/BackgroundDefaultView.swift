//
//  BackgroundDefaultView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 14/05/2021.
//

import SwiftUI

struct BackgroundDefaultView: View {
    var body: some View {
        Color.backgroundMain
            .ignoresSafeArea()
    }
}

struct BackgroundDefaultView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundDefaultView()
    }
}
