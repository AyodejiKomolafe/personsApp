//
//  PersonsListView.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import SwiftUI

struct PersonsListView: View {
    @State private var users: [User] = []
    var body: some View {
        NavigationView {
            List(users) { user in
                PersonsListCell(user: user)
            }
            .navigationTitle("👨‍👩‍👧‍👦 Persons")
        }
        .onAppear {
            getUsers()
        }
    }
    func getUsers() {
        NetworkManager.shared.getUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self.users = users
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct PersonsListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsListView()
    }
}
