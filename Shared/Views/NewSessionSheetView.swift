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
    @State var colorSelected: String = "mainBlue"
    @State var colorID: Int = 1
    
    let allColors: [Int: String] = [
        01: "mainBlue",
        02: "mainOrange",
        03: "mainPink",
        04: "mainDarkPink",
        05: "mainSky",
        06: "mainLightBlue",
        07: "mainPurple"
    ]
    
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
                            ForEach(Array(allColors.enumerated()), id: \.offset) { index, color in
                                VStack{
                                    ColorSelection(selection: $colorID, color: color.value, id: color.key)
                                        .onTapGesture {
                                            self.colorSelected = color.value
                                            self.colorID = color.key
                                        }
                                }
                            }
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
                            newSession.color = self.colorSelected
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

struct ColorSelection: View {
    
    @Binding var selection: Int
    @State var isSelected: Bool = false
    
    var color: String
    var id: Int
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .center){
                Color(color)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            }
            if selection == id {
                Circle()
                    .fill(Color.textPurple)
                    .frame(width: 5, height: 5)
                    .opacity(1)
            } else {
                Circle()
                    .fill(Color.textPurple)
                    .frame(width: 5, height: 5)
                    .opacity(0)
            }
        }.frame(width: 40).padding(.top, 6).padding(.bottom, 2)
    }
    
}

struct NewSessionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewSessionSheetView()
    }
}
