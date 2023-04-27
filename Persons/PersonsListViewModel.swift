//
//  PersonsListViewModel.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import Foundation

final class PersonsListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getUsers() {
        isLoading = true
        NetworkManager.shared.getUsers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let users):
                    self.users = users
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
