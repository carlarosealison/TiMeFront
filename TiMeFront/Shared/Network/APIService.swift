//
//  APIService.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

class APIService{
    
    let baseURL: URL = URL(string:"http://127.0.0.1:8080")!
    
    enum TVShowError: Error{
           case httpResponseError
           case decodeError
           case dataEmpty
           case urlSessionError
       }
       
       
    func get<T:Decodable>(endpoint: String, as type: T.Type)async throws -> T{
        let url = URL(string:"\(baseURL)/\(endpoint)")!
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                throw TVShowError.httpResponseError
            }
            guard !data.isEmpty else{
                throw TVShowError.dataEmpty
            }
            do{
                let decodeObjectRest = try JSONDecoder().decode(T.self, from: data)
                return decodeObjectRest
            }catch{
                print("\(error)")
                throw TVShowError.decodeError
            }
        }catch{
            print("\(error)")
            throw TVShowError.urlSessionError
            
        }
    }
    
    
    func post<U:Encodable>(endpoint: String, body: U) async throws -> HTTPURLResponse{
        let url = URL(string:"\(baseURL)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else{
            throw URLError(.badServerResponse)
        }
        print("HTTP Status:", httpResponse.statusCode)
        
        return httpResponse
    }
}
