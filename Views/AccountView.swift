//
//  AccountView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI

struct UserProfile {
    let username: String
    let email: String
    let weight: Int
    let height: Int
    let emergencyContact: String
    var birthDate: Date
    var gender: String
    var location: String
}

struct AccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var editingBirthDate = false
    @State private var editingGender = false
    @State private var editingLocation = false
    
    let user: UserProfile
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button("Back to Menu") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding(.trailing)
            }
            .padding()
            
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(user.username)
                        .font(.title)
                        .foregroundColor(.primary)
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.leading, 20)
                
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Weight: \(user.weight) kg")
                Text("Height: \(user.height) cm")
                Text("Emergency Contact: \(user.emergencyContact)")
                Text("Birth Date: \(formattedDate)")
                    .onTapGesture {
                        editingBirthDate = true
                    }
                    .sheet(isPresented: $editingBirthDate) {
                    }
                Text("Gender: \(user.gender)")
                    .onTapGesture {
                        editingGender = true
                    }
                    .sheet(isPresented: $editingGender) {
                    }
                Text("Location: \(user.location)")
                    .onTapGesture {
                        editingLocation = true
                    }
                    .sheet(isPresented: $editingLocation) {
                    }
            }
            .padding()
            
            Spacer()
        }
    }
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: user.birthDate)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(user: UserProfile(username: "JohnDoe", email: "john.doe@example.com", weight: 75, height: 180, emergencyContact: "JaneDoe (+52 9381522681)", birthDate: Date(), gender: "Male", location: "New York"))
    }
}
