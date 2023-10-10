//
//  Service.swift
//  
//
//  Created by Hamza on 2023-07-08.
//

import Foundation

public protocol Service {
    func getModels<T: Decodable>(with url: String) async throws -> T
}

extension Service {
    func validate(response: HTTPURLResponse) -> Bool {
        if response.statusCode == 401 ||
            response.statusCode == 403 {
            return false
        } else if response.statusCode == 503 {
            return false
        } else if response.statusCode > 399 {
            return false
        } else {
            return true
        }
    }
}

public class NetworkService: Service {
    public static let baseURL = "https://rickandmortyapi.com/api/character/"
    
    public init() { }
    
    public func getModels<T: Decodable>(with url: String = baseURL) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkServiceError.InvalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              validate(response: response) else {
            throw NetworkServiceError.RequestError("Failed to perform request.")
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        
        return decodedData
    }
}

public enum NetworkServiceError: Error {
    case InvalidURL
    case RequestError(String)
    case UnknownError
}
