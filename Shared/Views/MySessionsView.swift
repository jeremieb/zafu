//
//  ListSessionCustomView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//
//  STACKOVERFLOW: https://stackoverflow.com/questions/58886568/swiftui-passing-data-from-view-to-modal-wont-update-correctly

import SwiftUI

struct MySessionsView: View {
    
    /// Timer data
    @StateObject var data = TimerData()
    
    /// Core Data
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    @FetchRequest(entity: Sessions.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Sessions.title, ascending: true)]) var sessions: FetchedResults<Sessions>
    
    /// Session detail
    @State private var showDetail = false
    @State private var selectedSession: Sessions? = nil
    
    var body: some View {
        if !sessions.isEmpty {
            VStack(alignment: .leading) {
                SectionHeaderView(title: "My Sessions").padding(.top, 30).foregroundColor(.elementSecondary)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10.0){
                        ForEach(sessions) { session in
                            Button(action: {
                                self.selectedSession = session
                            }) {
                                SquareCellsView(session: session)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .sheet(item: self.$selectedSession){ session in
                        SessionDetailView(session: session)
                            .environmentObject(dataController)
                            .environmentObject(data)
                    }
                }.padding(.top, 10)
            }
        } else {
            EmptyView()
        }
    }
}

// MARK: - Square Cell View
struct SquareCellsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var session: Sessions
    
    var body: some View {
        
        /// Content
        VStack {
            VStack(alignment: .leading){
                HStack {
                    Text(String(session.duration / 60) + " min")
                        .font(.caption)
                        .foregroundColor(colorScheme == .dark ? Color(session.color) : Color.mainPurple)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(colorScheme == .dark ? Color(session.color) : Color.mainPurple, lineWidth: 1)
                        )
                        .lineLimit(1)
                    Spacer()
                    
                    // if we have a icon
                    Image(systemName: session.icon)
                        .font(.system(size: 20))
                        .foregroundColor(colorScheme == .dark ? Color(session.color) : Color.mainPurple)
                        .opacity(0.5)
                }
                Spacer()
                Text(session.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? Color(session.color) : Color.mainPurple)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding()
            Spacer()
        }
        .background(Color(session.color).opacity(colorScheme == .dark ? 0.1 : 0.8))
        .frame(width: 150, height: 150)
        .cornerRadius(20)
    }
}

//struct ListSessionCustomView_Previews: PreviewProvider {
//
//    @State private var session: DataController
//
//    static var previews: some View {
//        Group {
//            SquareCellsView(session: )
//                .previewLayout(PreviewLayout.sizeThatFits)
//                .padding()
//                .previewDisplayName("Default preview")
//        }
//    }
//}


