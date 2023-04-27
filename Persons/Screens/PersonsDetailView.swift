//
//  PersonsDetailView.swift
//  Persons
//
//  Created by Kvng Eko on 4/27/23.
//

import SwiftUI

struct PersonsDetailView: View {
    let user: User
    @Binding var isShowingDetail: Bool
    var body: some View {
        VStack {
            PersonsRemoteImage(urlString: user.avatar)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .padding(.bottom, 10)
            VStack {
                Text("\(user.first_name) \(user.last_name)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(1)
                Text(user.email)
                    .font(.body)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    
            }
            .padding(.top, 40)
            .padding(.bottom, 40)
//            Spacer()
            Button {
                print("Friend Request Sent")
            } label: {
                Text("Add Friend")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }

        }
        .frame(width: 300, height: 500)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .frame(width: 44, height: 44)
                    .imageScale(.medium)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
    }

}

struct PersonsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsDetailView(user: MockUser.sampleUser, isShowingDetail: .constant(true))
    }
}
