import Foundation
import SwiftUI

struct ModelosView: View {
    @StateObject var viewModel: ModelosViewModel
    @State private var searchText = String()
    
    var filteredNames: [Modelo] {
        if searchText.isEmpty {
            viewModel.modelos
        } else {
            viewModel.modelos.filter { modelo in  modelo.nome.localizedStandardContains(searchText) }
        }
    }

    let marcaCodigo: String


    var body: some View {
        VStack {
            
            List(filteredNames, id: \.codigo) { modelos in
                Text(modelos.nome)
            }
//            .padding(.top)
            
            .onAppear {
                viewModel.fetchModelos(forMarca: marcaCodigo)
            }
        }
        .navigationTitle("Modelos")
//        .searchable(text: $searchText,prompt: "Escolha sua marca")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
        .navigationBarTitleDisplayMode(.inline)
       
    }
        
}


