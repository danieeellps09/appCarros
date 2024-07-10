import Foundation
import SwiftUI

struct AnosView: View {
    @StateObject var viewModel: AnosViewModel
    @State private var searchText = String()
    @AppStorage("isDarkMode") private var isDark = false
    
    var filteredNames: [Anos] {
        if searchText.isEmpty {
            viewModel.ano
        } else {
            viewModel.ano.filter { anos in  anos.nome.localizedStandardContains(searchText) }
        }
    }
    
    

    let modeloCodigo: String


    var body: some View {
        NavigationView{
            VStack {
                
                //            ButtonLDView()
                
                List(filteredNames, id: \.codigo) { ano in
                    Text(ano.nome)
                    
                    //                    .listRowBackground(Color.gray.opacity(0.8))
                    
                }
                //            .background(Gradient(colors: [.white, .gray, .black]))
                //            .background(.black)
                //            .scrollContentBackground(.hidden)
                //            .padding(.top)
                //            .scrollContentBackground(.hidden)
                
                .onAppear {
                    viewModel.fetchAnos(forModelo:modeloCodigo)
                }
                .navigationTitle("Anos")
            }
        }
        
//        .navigationTitle("Modelos")
//        .searchable(text: $searchText,prompt: "Escolha sua marca")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
        .toolbar{
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                Button(action:{isDark.toggle()},label:{ isDark ? Label("Dark",systemImage: "lightbulb.fill"): Label("Dark",systemImage: "lightbulb")
                })
            }

        }        .environment(\.colorScheme, isDark ? .dark : .light)
//        .navigationBarTitleDisplayMode(.inline)
        
      
        
        
    }
    
        
}


