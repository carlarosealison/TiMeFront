//
//  APIService.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

class APIService{
    
    static let shared = APIService() 
    
//#if targetEnvironment(simulator)
//let baseURL: URL = URL(string: "http://127.0.0.1:8080")!
//#else
//let baseURL: URL = URL(string: "http://10.80.59.29:8080")!
//#endif
#if targetEnvironment(simulator)
let baseURL: URL = URL(string: "http://127.0.0.1:8080")!
#else
let baseURL: URL = URL(string: "http://10.80.59.190:8080")!
#endif

    init() {
        print("🌍 BaseURL utilisée : \(baseURL)")
    }

    
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
                let decodeObjectRest = try jsonDecoder.decode(T.self, from: data)
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
    
    func getToken<T: Decodable>(endpoint: String, token: String, as type: T.Type) async throws -> T {
        // 1️⃣ Vérifie que l’URL est correcte
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        print("📡 [API] GET \(url)")
        print("🔐 Token utilisé : \(token)")

        // 3️⃣ Effectue la requête
        let (data, response) = try await URLSession.shared.data(for: request)

        // 4️⃣ Vérifie la réponse HTTP
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        // 🔍 Log des infos pour le debug
        print("📡 [API] GET \(url.absoluteString)")
        print("📦 Status code: \(httpResponse.statusCode)")
        if let body = String(data: data, encoding: .utf8) {
            print("🧾 Response body: \(body)")
        }

        // 5️⃣ Vérifie le code HTTP
        switch httpResponse.statusCode {
        case 200:
            // OK ✅
            return try JSONDecoder().decode(T.self, from: data)

        case 400:
            throw NSError(domain: "APIError", code: 400, userInfo: [NSLocalizedDescriptionKey: "Requête invalide (400)"])
        case 401:
            throw NSError(domain: "APIError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Non autorisé — token invalide ou expiré"])
        case 403:
            throw NSError(domain: "APIError", code: 403, userInfo: [NSLocalizedDescriptionKey: "Accès refusé (403)"])
        case 404:
            throw NSError(domain: "APIError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Ressource non trouvée (404)"])
        case 500...599:
            throw NSError(domain: "APIError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Erreur serveur (\(httpResponse.statusCode))"])
        default:
            throw NSError(domain: "APIError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Erreur inconnue (\(httpResponse.statusCode))"])
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
    

    func uploadImage(imageData: Data, fileName: String = "profile.jpg") async throws -> String {
        let url = baseURL.appendingPathComponent("users/upload")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        let mimetype = "image/jpeg"
        
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw TVShowError.httpResponseError
        }
        
        struct UploadResponse: Decodable { let imageURL: String }
        let decoded = try jsonDecoder.decode(UploadResponse.self, from: data)
        
        return decoded.imageURL
    }

    
    
    

    
}
