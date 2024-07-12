//
//  ValoresView.swift
//  irede-projeto1
//
//  Created by levi soares on 10/07/24.
//

import SwiftUI

struct ValoresView: View {

        @StateObject var viewModel: ValoresViewModel
        @State private var searchText = String()
        @AppStorage("isDarkMode") private var isDark = false
        
      
        
        let modeloCodigo: String
        let marcaCodigo: String
        let anoCodigo: String

        var body: some View {
            NavigationView{
                VStack {
                    
                    if let carro = viewModel.carros {
                                    List {
                                        Text(carro.Valor)
                                        Text(carro.Marca)
                                        Text(carro.Modelo)
                                        Text(carro.Combustivel)
                                        Text(carro.CodigoFipe)
                                        Text(carro.MesReferencia)
                                    }
                                    .navigationTitle("Detalhes do Carro")
                                } else {
                                    ProgressView()
                                        .onAppear {
                                            viewModel.fetchValores(forCarro: marcaCodigo, forModelo: modeloCodigo, forAnos: anoCodigo)
                                        }
                                }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Escolha sua marca")
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
     Label("Dark",systemImage: "lightbulb")
                    
                    ButtonLDView( isDark: $isDark)
                }
            }
            .environment(\.colorScheme, isDark ? .dark : .light)
        }
    }



