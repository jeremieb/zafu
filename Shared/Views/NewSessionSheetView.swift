//
//  NewSessionSheetView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 31/05/2021.
//

import SwiftUI

struct NewSessionSheetView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    
    @State var title: String = ""
    @State var duration: Int16 = 5
    @State var icon: String = "leaf"
    @State var color: String = "mainBlue"
    
    var computedColor: Color {
        return Color(color)
    }
    
    var body: some View {
        NavigationView{
            
            Form {
                Section(header: Text("Session title")) {
                    TextField("Give your session a name", text: $title)
                }
                
                Section(header: Text("Duration"), footer: Text("Choose a duration for your meditation session up to 90 minutes").fixedSize(horizontal: false, vertical: true)) {
                    Stepper("\(duration) minutes", value: $duration, in: 5...90)
                }
                
                Section(header: Text("Customization")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
                            Image(systemName: icon)
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
                            computedColor
                                .frame(width: 32)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .navigationTitle("New Session")
            .toolbar(content: {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancel").fontWeight(.regular)
                        })
                        Spacer()
                        Button(action: {
                            guard self.title != "" else {return}
                            guard self.icon != "" else {return}
                            let newSession = Sessions(context: dataController.container.viewContext)
                            newSession.title = self.title
                            newSession.duration = Int16(self.duration)
                            newSession.icon = self.icon
                            newSession.color = self.color
                            newSession.id = UUID()
                            dataController.save()
                            print("New session saved.")
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Add Session").fontWeight(.semibold)
                        }
                    }.frame(width: UIScreen.main.bounds.size.width - 32).padding(.horizontal)
                }
            })
        }
    }
}
struct NewSessionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewSessionSheetView()
    }
}
