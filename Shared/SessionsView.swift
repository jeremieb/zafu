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
    
    @StateObject var data = TimerData()
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    @FetchRequest(entity: Sessions.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Sessions.title, ascending: true)])
    
    var sessions: FetchedResults<Sessions>
    
    @State var showSheet = false
    @State var selectedSession: Sessions? = nil
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(sessions) { session in
                        VStack(alignment: .leading) {
                            SquareCellsView(title: session.title, duration: Int(session.duration), icon: session.icon, color: Color(session.color))
                                .onTapGesture {
                                    self.selectedSession = session
                                }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 32)
                        .padding(.horizontal)
                        
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
                }
                
            }
            .navigationTitle("My Sessions")
            .background(BackgroundView())
            .navigationBarItems(trailing: Button(action: {
                showSheet = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
        }
    }
}



struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
