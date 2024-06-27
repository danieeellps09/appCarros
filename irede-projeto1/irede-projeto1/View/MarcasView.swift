
import Foundation
import SwiftUI

struct MarcasView: View {
     var viewModel = MarcaViewModel()
    
    var body: some View {
        VStack {
            Text("Marcas")
                .font(.title)
            
            List(viewModel.marcas, id: \.codigo) { marca in
                Text(marca.nome)
            }
            .onAppear {
                viewModel.fetchMarcas()
            }
        }
    }
}
