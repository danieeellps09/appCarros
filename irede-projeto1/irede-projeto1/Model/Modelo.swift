// Modelo.swift
// irede-projeto1
//
// Created by Daniel Lopes da Silva on 26/06/24.
//

import Foundation

struct Modelos: Codable {
    let modelos: [Modelo]
}

struct Modelo: Codable, Identifiable {
    let codigo: Int
    let nome: String
    
    var id: Int {
        codigo
    }
}
