////
////  ToolbarView.swift
////  irede-projeto1
////
////  Created by levi soares on 05/07/24.
////
//
//import SwiftUI
//
//struct ToolbarView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Search view
//                HStack {
//                    HStack {
//                        
//                        
//                        TextField("", text: $searchText, onEditingChanged: { isEditing in
//                            self.showCancelButton = true
//                        }, onCommit: {
//                            print("onCommit")
//                        }).foregroundColor(.primary)
//                        
//                        Button(action: {
//                            self.searchText = ""
//                        }) {
//                        }
//                    }
//                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
//                    .foregroundColor(.secondary)
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(10.0)
//                    
//                    
//                    self.searchText = ""
//                    self.showCancelButton = false
//                }
//                .foregroundColor(Color(.systemBlue))
//            }
//        }
//        .padding(.horizontal)
//        .navigationBarHidden() // .animation(.default) // animation does not work properly
//        
//        List {
//            // Filtered list of names
//            ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
//                searchText in Text(searchText)
//            }
//        }
//        .navigationBarTitle(Text(""))
//        .resignKeyboardOnDragGesture()
//    }
//}
//                       
//                   
//
//
//
//struct ContentView_Previews: PreviewProvider {
//static var previews: some View {
//Group {
//                             
//            .environment(\.colorScheme, .light)
//
//                             
//            .environment(\.colorScheme, .dark)
//                          }
//                       }
//                   }
//
