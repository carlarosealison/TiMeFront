//
//  APIService.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

class APIService{
    
#if targetEnvironment(simulator)
    let baseURL: URL = URL(string: "http://127.0.0.1:8080")!
#else
    let baseURL: URL = URL(string: "http://10.80.59.29:8080")!
#endif
    
    // Configuration des encoders/decoders pour gérer les dates de Vapor (format ISO8601) vers Swift (format timestamp)
    private let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }()
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    enum TVShowError: Error{
        case httpResponseError
        case decodeError
        case dataEmpty
        case urlSessionError
    }
    
    
    func get<T:Decodable>(endpoint: String, as type: T.Type)async throws -> T{
        // cette fonction nous renvoie un objet T ( retour d'un type)
        
        let url = URL(string:"\(baseURL)/\(endpoint)")!
        // ici la route effectué lors d'une request
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            //ici appel de l'API via la route
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                throw TVShowError.httpResponseError
            } //ici vérification de la bonne response HTTP -> cela signifie que la requête est bien effectué
            
            guard !data.isEmpty else{
                throw TVShowError.dataEmpty
            }
            //vérifie que la donnée n'est pas vide
            
            do{
                let decodeObjectRest = try JSONDecoder().decode(T.self, from: data)
                return decodeObjectRest
                //décode notre réponse JSON
            }catch{
                print("\(error)")
                throw TVShowError.decodeError
                
            }
        }catch{
            print("\(error)")
            throw TVShowError.urlSessionError
            
        }
    }
    
    
    //    func post<U:Encodable>(endpoint: String, body: U) async throws -> HTTPURLResponse{
    //        let url = URL(string:"\(baseURL)/\(endpoint)")!
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.httpBody = try JSONEncoder().encode(body)
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        let (_, response) = try await URLSession.shared.data(for: request)
    //        guard let httpResponse = response as? HTTPURLResponse else{
    //            throw URLError(.badServerResponse)
    //        }
    //        print("HTTP Status:", httpResponse.statusCode)
    //
    //        return httpResponse
    //    }
    
    func post<T:Decodable, U:Encodable>(endpoint: String, body: U) async throws -> T{
        let url = URL(string:"\(baseURL)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try jsonEncoder.encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, _) = try await URLSession.shared.data(for: request)
        return try jsonDecoder.decode(T.self, from: data)
    }
    
    
    
    
    
}
