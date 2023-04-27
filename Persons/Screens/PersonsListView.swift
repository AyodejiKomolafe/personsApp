//
//  PersonsListView.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import SwiftUI

struct PersonsListView: View {
    @StateObject var viewModel = PersonsListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedUser: User?
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.users) { user in
                    PersonsListCell(user: user)
                        .onTapGesture {
                            selectedUser = user
                            isShowingDetail = true
                        }
                }
                .navigationTitle("👨‍👩‍👧‍👦 Persons")
                .disabled(isShowingDetail)
            }
            .onAppear {
                viewModel.getUsers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                PersonsDetailView(user: selectedUser ?? MockUser.sampleUser, isShowingDetail: $isShowingDetail)
            }
            if viewModel.isLoading {
                LoadingView()
            }
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
