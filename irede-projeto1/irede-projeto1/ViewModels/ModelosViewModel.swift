//
//  ModelViewModel.swift
//  irede-projeto1
//
//  Created by Daniel Lopes da Silva on 26/06/24.
//



import SwiftUI

import Foundation


class ModelosViewModel: Observable {
    @Published var modelos : [Modelo] = []

    func fetchModelos(forMarca marcaCodigo: String) {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(marcaCodigo)/modelos") else {
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
                let modelos = try JSONDecoder().decode([Modelo].self, from: data)
                DispatchQueue.main.async {
                    self.modelos = modelos
                    print("deu bom os dados modelos")

                }
            } catch {
                print("Erro ao decodificar JSON: (error)")
            }
        }

        task.resume()
    }

}
