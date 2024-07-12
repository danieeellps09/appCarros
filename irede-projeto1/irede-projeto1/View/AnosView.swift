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
    let marcaCodigo: String
    var body: some View {
        NavigationView{
            VStack {
                
                List(filteredNames, id: \.codigo) { ano in
                    
                    NavigationLink(destination: ValoresView(viewModel: ValoresViewModel(), modeloCodigo: modeloCodigo ,marcaCodigo: marcaCodigo, anoCodigo: ano.codigo)) {
                        Text(ano.nome)
                    }
                    
                }
                .onAppear {
                    viewModel.fetchAnos(forCarro:marcaCodigo,forModelo:modeloCodigo)
                }
                .navigationTitle("Anos")
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
                .toolbar{
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
         Label("Dark",systemImage: "lightbulb")
                }
            }
            .environment(\.colorScheme, isDark ? .dark : .light)
        }
    }
    
    
}
