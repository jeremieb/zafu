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
    
    @State private var title: String = ""
    @State private var duration: Int16 = 5
    @State private var interval: Int16 = 0
    @State private var iconSelected: String = "leaf.fill"
    @State private var iconID: Int = 1
    @State private var colorSelected: String = "mainBlue"
    @State private var colorID: Int = 1
    
    private let allIcons: [Int: String] = [
        01: "leaf.fill",
        02: "sun.max.fill",
        03: "wind",
        04: "bolt.horizontal.fill",
        05: "mouth.fill",
        06: "hand.raised.fill",
        07: "flame.fill"
    ]
    
    private let allColors: [Int: String] = [
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
                
                /// Session Title
                Section(header: Text("Session title")) {
                    TextField("Give your session a name", text: $title)
                }
                
                /// Duration picker
                Section(header: Text("Duration"), footer: Text("Choose a duration for your meditation session up to 90 minutes").fixedSize(horizontal: false, vertical: true)) {
                    Stepper("\(duration) minutes", value: $duration, in: 5...90, step: 5)
                }
                
                /// Interval
                Section(header: Text("Interval"), footer: Text("You can add a small alert during your session.").fixedSize(horizontal: false, vertical: true)) {
                    Stepper("\(interval) minutes", value: $interval, in: 0...duration - 5, step: 5)
                }
                
                Section(header: Text("Customization")) {
                    
                    /// Icon Selection
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
                            ForEach(Array(allIcons.enumerated()), id: \.offset) { index, icon in
                                VStack{
                                    IconSelection(selection: $iconID, icon: icon.value, id: icon.key)
                                        .onTapGesture {
                                            self.iconSelected = icon.value
                                            self.iconID = icon.key
                                        }
                                }.padding(.trailing, 4)
                            }
                        }
                    }.padding(.trailing, -20)
                    
                    /// Color selection
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
                            ForEach(Array(allColors.enumerated()), id: \.offset) { index, color in
                                VStack{
                                    ColorSelection(selection: $colorID, color: color.value, id: color.key)
                                        .onTapGesture {
                                            self.colorSelected = color.value
                                            self.colorID = color.key
                                        }
                                }.padding(.trailing, 4)
                            }
                        }
                    }.padding(.trailing, -20)
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
                            guard self.iconSelected != "" else {return}
                            let newSession = Sessions(context: dataController.container.viewContext)
                            newSession.objectWillChange.send()
                            newSession.title = self.title
                            newSession.duration = Int16(self.duration) * 60
                            newSession.icon = self.iconSelected
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

// MARK: - ICON SELECTION VIEW
struct IconSelection: View {
    
    @Binding var selection: Int
    @State private var isSelected: Bool = false
    
    var icon: String
    var id: Int
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .center){
                Image(systemName: icon)
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

// MARK: - COLOR SELECTION VIEW
struct ColorSelection: View {
    
    @Binding var selection: Int
    @State private var isSelected: Bool = false
    
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
