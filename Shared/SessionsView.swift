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
    @FetchRequest(entity: Sessions.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Sessions.title, ascending: true)]) var sessions: FetchedResults<Sessions>
    
    /// Show modals
    @State private var showSheet = false
    @State private var selectedSession: Sessions? = nil
    
    /// Show edit
    @State private var editMode = false
    @State private var editSheet = false
    
    /// Layout columns
    let columns = [
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.3)),
        GridItem(.fixed(UIScreen.main.bounds.size.width / 2.3))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30){
                    ForEach(sessions) { session in
                        if editMode {
                            ZStack {
                                SquareCellsView(session: session).overlay(Color(UIColor.systemBackground).clipShape(RoundedRectangle.init(cornerRadius: 20)).opacity(0.7))
                                HStack(spacing: 15.0) {
                                    Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: "pencil.circle").font(.system(size: 32)).foregroundColor(.mainPurple)
                                    })
                                    Button(action: { dataController.delete(session) }, label: {
                                        Text("\(Image(systemName: "trash.circle"))").font(.system(size: 32)).fontWeight(.regular).foregroundColor(.red)
                                    })
                                }
                            }
                        } else {
                            Button(action: {
                                self.selectedSession = session
                            }) {
                                SquareCellsView(session: session)
                            }
                        }
                    }
                }.padding(.top, 30)
                .sheet(item: self.$selectedSession){ session in
                    SessionDetailView(session: session).environmentObject(dataController).environmentObject(data)
                }
                EmptyView()
                    .sheet(isPresented: $showSheet) {
                        NewSessionSheetView().environmentObject(dataController)
                    }
                    .navigationTitle("My Sessions")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            if editMode {
                                Button(action: {
                                    dataController.save()
                                    editMode = false
                                }) {
                                    Text("Save")
                                }
                            } else {
                                Menu {
                                    Section{
                                        /// Add a session
                                        Button(action: { showSheet = true }) {
                                            Label("Add a session", systemImage: "plus.circle")
                                        }
                                        
                                        /// Edit mode
                                        Button(action: { editMode = true }) {
                                            Label("Edit", systemImage: "pencil.circle")
                                        }
                                    }
                                    Section{
                                        /// Delete all - ⚠️ Cannot be customized for now...
                                        /// https://stackoverflow.com/questions/58467846/how-to-configure-contextmenu-buttons-for-delete-and-disabled-in-swiftui
                                        Button(action: { dataController.deleteAll() }) {
                                            Label("Delete all", systemImage: "trash")
                                        }.foregroundColor(.red) /// doesn't work for now...
                                    }
                                }
                                label: {
                                    Label("Add", systemImage: "ellipsis.circle").font(.system(size: 24))
                                }
                            }
                        }
                    }
            }.background(BackgroundView())
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
