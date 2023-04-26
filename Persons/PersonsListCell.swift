//
//  PersonsListCell.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import SwiftUI

struct PersonsListCell: View {
    let user: User
    var body: some View {
        HStack {
            Image("blank")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5) {
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
}

struct PersonsListCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonsListCell(user: MockUser.sampleUser)
    }
}
