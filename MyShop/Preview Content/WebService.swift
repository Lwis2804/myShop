//
//  WebService.swift
//  MyShop
//
//  Created by LUIS GONZALEZ on 26/09/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badRequest
    case decodingError
}


class WebService {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as?  HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw    NetworkError.badRequest
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodingError
        }
        return products
    }
}
