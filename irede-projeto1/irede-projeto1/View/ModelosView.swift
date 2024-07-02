import Foundation
import SwiftUI

struct ModelosView: View {
    @StateObject var viewModel: ModelosViewModel
    @State private var searchText = ""
    
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
            .padding(.top)
            .searchable(text: $searchText, prompt: "Escolha sua marca")
            
            .onAppear {
                viewModel.fetchModelos(forMarca: marcaCodigo)
            }
            .navigationTitle("Modelos")
        }
       
    }
        
}

                             

