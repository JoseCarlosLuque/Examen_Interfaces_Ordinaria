//
//  APIService.swift
//  Examen_JCLC
//
//  Created by Jose Carlos Luque Castro on 11/3/25.
//

import Foundation

class APIService {
    func fetchAllProducts(completion: @escaping (Result<[Producto], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/products/category/electronics") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue(Constants.bearerToken, forHTTPHeaderField: "Authorization") // ✅ Aquí usamos el Bearer Token

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "DataError", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let productoResponse = try JSONDecoder().decode(ProductoResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(productoResponse.results))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
