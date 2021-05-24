//
//  AirPlayView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/05/2021.
//

import SwiftUI
import AVKit

struct AirPlayView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {

        let routePickerView = AVRoutePickerView()
        routePickerView.backgroundColor = UIColor.clear
        routePickerView.activeTintColor = UIColor.systemPink
        routePickerView.tintColor = UIColor(Color.elementSecondary)

        return routePickerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
