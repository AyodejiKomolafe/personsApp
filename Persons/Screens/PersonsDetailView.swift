//
//  PersonsDetailView.swift
//  Persons
//
//  Created by Kvng Eko on 4/27/23.
//

import SwiftUI

struct PersonsDetailView: View {
    let user: User
    var body: some View {
        VStack {
            Image("blank")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text("\(user.first_name) \(user.last_name)")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(user.email)
                    .font(.body)
                    .padding(-5)
            }
            Spacer()
            
        }
        .frame(width: 300, height: 325)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Text("test"), alignment: .topTrailing)
    }
}

struct PersonsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsDetailView(user: MockUser.sampleUser)
    }
}
