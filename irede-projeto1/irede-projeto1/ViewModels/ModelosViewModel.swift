// ModelosViewModel.swift
// irede-projeto1
//
// Created by Daniel Lopes da Silva on 26/06/24.
//

import Foundation

class ModelosViewModel: ObservableObject {
    @Published var modelos: [Modelo] = []

    func fetchModelos(forMarca marcaCodigo: String) {
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(marcaCodigo)/modelos") else {
            print("URL inválida")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let data = data else {
                print("Resposta inválida ou sem dados")
                return
            }

            do {
                let modelosResponse = try JSONDecoder().decode(Modelos.self, from: data)
                DispatchQueue.main.async {
                    self.modelos = modelosResponse.modelos
                    print("Modelos carregados com sucesso")
                }
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
        }

        task.resume()
    }
}
