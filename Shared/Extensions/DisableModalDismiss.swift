//
//  DisableModalDismiss.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

// From this post: https://stackoverflow.com/questions/56615408/prevent-dismissal-of-modal-view-controller-in-swiftui/60939207#60939207

import SwiftUI
import UIKit

extension UIApplication {
    
    func visibleViewController() -> UIViewController? {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return nil }
        guard let rootViewController = window.rootViewController else { return nil }
        return UIApplication.getVisibleViewControllerFrom(vc: rootViewController)
    }
    
    private static func getVisibleViewControllerFrom(vc:UIViewController) -> UIViewController {
        if let navigationController = vc as? UINavigationController,
           let visibleController = navigationController.visibleViewController  {
            return UIApplication.getVisibleViewControllerFrom( vc: visibleController )
        } else if let tabBarController = vc as? UITabBarController,
                  let selectedTabController = tabBarController.selectedViewController {
            return UIApplication.getVisibleViewControllerFrom(vc: selectedTabController )
        } else {
            if let presentedViewController = vc.presentedViewController {
                return UIApplication.getVisibleViewControllerFrom(vc: presentedViewController)
            } else {
                return vc
            }
        }
    }
}

struct DisableModalDismiss: ViewModifier {
    let disabled: Bool
    func body(content: Content) -> some View {
        disableModalDismiss()
        return AnyView(content)
    }
    
    func disableModalDismiss() {
        guard let visibleController = UIApplication.shared.visibleViewController() else { return }
        visibleController.isModalInPresentation = disabled
    }
}

//Documentation

// To be used like this:

//struct ShowSheetView: View {
//    @State private var showSheet = true
//    var body: some View {
//        Text("Hello, World!")
//        .sheet(isPresented: $showSheet) {
//            TestView()
//                .modifier(DisableModalDismiss(disabled: true))
//        }
//    }
//}
