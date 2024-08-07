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
                
                List(filteredNames, id: \.codigo) { modelos in
                    
                    let codigo = String(modelos.codigo)

                    NavigationLink(destination: AnosView(viewModel: AnosViewModel(), modeloCodigo: codigo, marcaCodigo: marcaCodigo)) {
                        Text(modelos.nome)
                    }
                }
                .onAppear {
                    viewModel.fetchModelos(forMarca: marcaCodigo)
                }
                .navigationTitle("Modelos")
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
        .toolbar{
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){

                ButtonLDView(isDark: $isDark )
            }
        }
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
}


