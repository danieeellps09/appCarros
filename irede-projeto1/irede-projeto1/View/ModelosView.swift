import Foundation
import SwiftUI

struct ModelosView: View {
    @StateObject var viewModel: ModelosViewModel
    @State private var searchText = String()
    @AppStorage("isDarkMode") private var isDark = false
    
    var filteredNames: [Modelo] {
        if searchText.isEmpty {
            viewModel.modelos
        } else {
            viewModel.modelos.filter { modelo in  modelo.nome.localizedStandardContains(searchText) }
        }
    }
    
    

    let marcaCodigo: String


    var body: some View {
        NavigationView{
            VStack {
                
                //            ButtonLDView()
                
                List(filteredNames, id: \.codigo) { modelos in
                    
                    let codigo = String(modelos.codigo)

                    NavigationLink(destination: AnosView(viewModel: AnosViewModel(), modeloCodigo: codigo, marcaCodigo: marcaCodigo)) {
                        Text(modelos.nome)
                    }
                    
                    //                    .listRowBackground(Color.gray.opacity(0.8))
                    
                }
                //            .background(Gradient(colors: [.white, .gray, .black]))
                //            .background(.black)
                //            .scrollContentBackground(.hidden)
                //            .padding(.top)
                //            .scrollContentBackground(.hidden)
                
                .onAppear {
                    viewModel.fetchModelos(forMarca: marcaCodigo)
                }
                .navigationTitle("Modelos")
            }
        }
        
//        .navigationTitle("Modelos")
//        .searchable(text: $searchText,prompt: "Escolha sua marca")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
        .toolbar{
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                Button(action:{isDark.toggle()},label:{ isDark ? Image(systemName: "moon.fill").foregroundStyle(.white): Image(systemName: "sun.max.fill").foregroundStyle(.black)
                })
            }

        }      .environment(\.colorScheme, isDark ? .dark : .light)
//        .navigationBarTitleDisplayMode(.inline)
        
      
        
        
    }
    
        
}


