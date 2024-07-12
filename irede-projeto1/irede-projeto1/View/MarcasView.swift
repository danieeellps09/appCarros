
import Foundation
import SwiftUI

struct MarcasView: View {
    @StateObject var viewModel = MarcaViewModel()
    @State private var searchText = ""
    @AppStorage("isDarkMode") private var isDark = false
    
    var filteredNames: [Marca] {
        if searchText.isEmpty {
            viewModel.marcas
        } else {
            viewModel.marcas.filter { $0.nome.localizedStandardContains(searchText) }
        }
    }

    var body: some View {
        NavigationView{

                       VStack {
                           
                            List(filteredNames, id: \.codigo) { marca in
                                
                                NavigationLink(destination: ModelosView(viewModel: ModelosViewModel(), marcaCodigo: marca.codigo)) {
                                    Text(marca.nome)
                                }
                            }
                       }
                       
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
            
                .onAppear {
                        viewModel.fetchMarcas()
                        }
                .navigationTitle("Marcas")
        } 
                .toolbar{
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                        ButtonLDView(isDark: $isDark )
            }

        }       
                .environment(\.colorScheme, isDark ? .dark : .light)
                .navigationBarBackButtonHidden()
    }
}
#Preview {
    NavigationStack{
        MarcasView()
    }
}
