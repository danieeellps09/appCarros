
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
            //        NavigationStack{
                       VStack {
                           
            //               ToolbarView()
            //                ButtonLDView()

                           
                            List(filteredNames, id: \.codigo) { marca in
                                
                                
                                NavigationLink(destination: ModelosView(viewModel: ModelosViewModel(), marcaCodigo: marca.codigo)) {
                                    Text(marca.nome)
                                    
                                    
                                    
                                    
                                }
//                                .listRowBackground(Color.black.opacity(0.8))
                                
                            }
                        
            //                .background(Gradient(colors: [.white, .gray, .black]))
            //                .background(.black)
                       }
                       
                       .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
//                       .scrollContentBackground(.hidden)


                       
                       .onAppear {
                                viewModel.fetchMarcas()
                        }
                        .navigationTitle("Marcas")

                       
//                        .navigationBarTitleDisplayMode(.inline)
                        

            
        } .toolbar{
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                Button(action:{isDark.toggle()},label:{ isDark ? Label("Dark",systemImage: "lightbulb.fill"): Label("Dark",systemImage: "lightbulb")
                })
            }

        }        .environment(\.colorScheme, isDark ? .dark : .light)

        
            .navigationBarBackButtonHidden()
//        }
           
        
        
    }
}
#Preview {
    NavigationStack{
        MarcasView()
    }
}
