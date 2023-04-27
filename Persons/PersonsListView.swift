//
//  PersonsListView.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import SwiftUI

struct PersonsListView: View {
    @StateObject var viewModel = PersonsListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                PersonsListCell(user: user)
            }
            .navigationTitle("👨‍👩‍👧‍👦 Persons")
        }
        .onAppear {
            viewModel.getUsers()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
    }
    
}

struct PersonsListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsListView()
    }
}
