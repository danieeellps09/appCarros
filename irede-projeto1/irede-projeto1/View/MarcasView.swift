
import Foundation
import SwiftUI

struct MarcasView: View {
    @StateObject var viewModel = MarcaViewModel()
    
    var body: some View {
        NavigationStack{
           VStack {
                Text("Marcas")
                    .font(.title)
                
                List(viewModel.marcas, id: \.codigo) { marca in
                    
                    
                    NavigationLink(destination: ModelosView(viewModel: ModelosViewModel(), marcaCodigo: marca.codigo)) {
                        Text(marca.nome)
                        
                    }
                    
                }
            }.onAppear {
                viewModel.fetchMarcas()
                
        
            }
        }
        .navigationBarBackButtonHidden()
    }
}
#Preview {MarcasView()
}
