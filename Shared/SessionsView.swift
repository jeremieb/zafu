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
    
    @FetchRequest(entity: Sessions.entity(), sortDescriptors: [], predicate: NSPredicate(format: "title != %@"))

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
                    EmptyView()
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }
            .navigationTitle("My Sessions")
            .background(BackgroundView())
        }
    }
}



struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
