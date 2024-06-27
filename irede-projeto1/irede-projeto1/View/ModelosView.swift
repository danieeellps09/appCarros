import Foundation
import SwiftUI

struct ModelosView: View {
     var viewModel: ModelosViewModel
    let marcaCodigo: String
    
    var body: some View {
        VStack {
            Text("Modelos")
                .font(.title)
            
            List(viewModel.modelos, id: \.codigo) { modelo in
                Text(modelo.nome)
            }
            .onAppear {
                viewModel.fetchModelos(forMarca: marcaCodigo)
            }
        }
    }
}
