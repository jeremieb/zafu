//
//  SessionsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct SessionsView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.mainPurple)]
    }
    
    /// Timer running or not
    @StateObject var data = TimerData()
    
    /// Core Data
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    @FetchRequest(entity: Sessions.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Sessions.title, ascending: true)])
    
    var sessions: FetchedResults<Sessions>
    
    /// Show modals
    @State private var showSheet = false
    @State private var selectedSession: Sessions? = nil
    
    /// List
    let columns = [
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.3)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.3))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30){
                    ForEach(sessions) { session in
                        SquareCellsView(title: session.title, duration: Int(session.duration), icon: session.icon, color: Color(session.color))
                            .onTapGesture {
                                self.selectedSession = session
                            }
                    }
                }.padding(.top, 30)
                .sheet(item: self.$selectedSession){ session in
                    SessionDetailView(title: session.title, icon: session.icon, duration: Int(session.duration), color: Color(session.color)).modifier(DisableModalDismiss(disabled: true)).environmentObject(dataController).environmentObject(data)
                }
                
                /// DELETE ALL button
                Button(action: {
                    withAnimation {
                        dataController.deleteAll()
                    }
                }) {
                    Label("Erase all?", systemImage: "trash").padding().frame(width: UIScreen.main.bounds.size.width - 56).background(Color(UIColor.systemBackground).colorInvert().opacity(0.15)).cornerRadius(10).foregroundColor(Color(UIColor.systemRed))
                }.padding(.top, 120)
                .sheet(isPresented: $showSheet) {
                    NewSessionSheetView()
                }
                .navigationTitle("My Sessions")
                .navigationBarItems(trailing: Button(action: {
                    showSheet = true
                }, label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }))
            }
            .background(BackgroundView())
        }
    }
}



struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
