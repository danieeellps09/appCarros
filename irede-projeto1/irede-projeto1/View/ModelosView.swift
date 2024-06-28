import Foundation
import SwiftUI

struct ModelosView: View {
    @StateObject var viewModel: ModelosViewModel
    let marcaCodigo: String
    
    var body: some View {
        VStack {
            Text("Modelos")
                .font(.title)
            
            List(viewModel.modelos, id: \.codigo) { modelos in
                Text(modelos.nome)
            }
            .onAppear {
                viewModel.fetchModelos(forMarca: marcaCodigo)
            }
        }
    }
}
