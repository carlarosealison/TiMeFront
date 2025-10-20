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

    init() {}

    
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
    
    /// Permet d'utliser les query parameters qui servent à récupérer un user précis avec des jours précis et les mettre dans l'url de requête pour l'historique du journal
    /// On filtre les données d'un seul user (celui connecté) plutôt que toutes les données du journal de tous les users
    func get<T: Decodable>(
        endpoint: String,
        queryParameters: [String: String],
        as type: T.Type = T.self
    ) async throws -> T {
        
        var urlComponents = URLComponents(
            url: baseURL.appendingPathComponent(endpoint),
            resolvingAgainstBaseURL: false
        )!
        
        // Ajoute les query parameters (?date=xxx&userId=yyy)
        urlComponents.queryItems = queryParameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        guard let url = urlComponents.url else {
            throw TVShowError.urlSessionError
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw TVShowError.httpResponseError
            }
            guard !data.isEmpty else {
                throw TVShowError.dataEmpty
            }
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            throw TVShowError.urlSessionError
        }
    }
    
    // Utilisation de cette méthode :
    // let dayData: DayDataDTO = try await apiService.get(
    // endpoint: "journal/day",
    // queryParameters: [
    // "date": "2025-01-12T00:00:00Z",
    // "userId": "xxx-xxx-xxx"
    // ]
    // )
    
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
