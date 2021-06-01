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
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    @FetchRequest(entity: Sessions.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Sessions.title, ascending: true)])
    
    var sessions: FetchedResults<Sessions>
    
    @State var showSessionSheet = false
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(sessions) { session in
                        VStack(alignment: .leading) {
                            Text(session.title)
                            Text(String(session.duration))
                                .font(.footnote)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }
            .navigationTitle("My Sessions")
            .background(BackgroundView())
            .navigationBarItems(trailing: Button(action: {
                showSessionSheet = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $showSessionSheet) {
                NewSessionSheetView()
            }
        }
    }
}



struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
