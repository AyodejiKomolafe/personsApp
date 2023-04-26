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
                    HStack {
                        Image("blank")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 90)
                            .cornerRadius(8)
                        VStack {
                            HStack {
                                Text(user.first_name)
                                Text(user.last_name)
                            }
                            .font(.title2)
                            .fontWeight(.medium)
                            Text(user.email)
                        }
                        
                    }
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
