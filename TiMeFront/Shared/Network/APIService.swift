//
//  APIService.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

class APIService{
    
    let baseURL: URL = URL(string:"http://127.0.0.1:8080/users")!
    
    func post<T:Decodable, U:Encodable>(endpoint: String, body: U) async throws -> T{
        let url = URL(string:"\(baseURL)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
