//
//  NetworkManager.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://reqres.in/api/"
    private let userURL = baseURL + "users"
    
    private init() {}
    
    func getUsers(completed: @escaping (Result<[User],UserError>) -> Void) {
        guard let url = URL(string: userURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(UserResponse.self, from: data)
                completed(.success(decoderResponse.data))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
}
