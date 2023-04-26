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
        
    }
    
    
}
