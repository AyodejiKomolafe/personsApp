//
//  PersonsListView.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import SwiftUI

struct PersonsListView: View {
    var body: some View {
            NavigationView {
                List(MockUser.users) { user in
                   PersonsListCell(user: user)
                }
                .navigationTitle("👨‍👩‍👧‍👦 Persons")
            }
    }
}

struct PersonsListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsListView()
    }
}
