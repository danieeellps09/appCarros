//
//  Carros.swift
//  irede-projeto1
//
//  Created by levi soares on 10/07/24.
//

import Foundation

struct Carros: Codable,Hashable {
    let TipoVeiculo : Int
    let Valor : String
    let Marca : String
    let Modelo : String
    let AnoModelo : Int
    let Combustivel: String
    let CodigoFipe : String
    let MesReferencia : String
    let SiglaCombustivel : String
}


