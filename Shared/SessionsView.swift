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
    @State var showSheet = false
    @State var selectedSession: Sessions? = nil
    
    /// List
    let columns = [
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(sessions) { session in
                        SquareCellsView(title: session.title, duration: Int(session.duration), icon: session.icon, color: Color(session.color))
                            .onTapGesture {
                                self.selectedSession = session
                            }
                    }
                }
                .sheet(item: self.$selectedSession){ session in
                    SessionDetailView(title: session.title, icon: session.icon, duration: Int(session.duration), color: Color(session.color)).modifier(DisableModalDismiss(disabled: true)).environmentObject(dataController).environmentObject(data)
                }
                Button(action: {
                    dataController.deleteAll()
                }) {
                    Text("Erase all?")
                }.padding(.top)
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
