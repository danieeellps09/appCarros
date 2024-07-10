//
//  MarcaViewModel.swift
//  irede-projeto1
//
//  Created by Daniel Lopes da Silva on 26/06/24.
//



import SwiftUI

import Foundation


class AnosViewModel: ObservableObject {
    @Published var ano : [Anos] = []

    func fetchAnos(forCarro marcaCarro:String, forModelo modeloCodigo: String ) {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(marcaCarro)/modelos/\(modeloCodigo)/anos") else {
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
                let anos = try JSONDecoder().decode([Anos].self, from: data)
                DispatchQueue.main.async {
                    self.ano = anos
                    print("Deu bom")
                }
            } catch {
                print("Erro ao decodificar JSON: (error)")
            }
        }

        task.resume()
    }

}
