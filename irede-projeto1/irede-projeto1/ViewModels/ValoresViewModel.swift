//
//  ValoresViewModel.swift
//  irede-projeto1
//
//  Created by levi soares on 10/07/24.
//


import SwiftUI

import Foundation


class ValoresViewModel: ObservableObject {
    @Published var carros : Carros?

    func fetchValores(forCarro marcaCarro:String, forModelo modeloCodigo: String, forAnos anoCodigo: String ) {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(marcaCarro)/modelos/\(modeloCodigo)/anos/\(anoCodigo)") else {
            print("URL inválida")
            return
        }

        let semaphore = DispatchSemaphore(value: 0)

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer { semaphore.signal() }

            if error != nil {
                print("Erro: (error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let data = data else {
                print("Resposta inválida ou sem dados")
                return
            }

            do {
                let carros = try JSONDecoder().decode(Carros.self, from: data)
                DispatchQueue.main.async {
                    self.carros = carros
                    print("Deu bom carregar os valores")
                }
            } catch {
                print("Erro ao decodificar JSON: (error)")
            }
        }

        task.resume()
    }

}
