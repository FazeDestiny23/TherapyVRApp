//
//  SideBarView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI

struct SideBarView: View {
    let user: UserProfile
    var body: some View {
        NavigationView {
            List(sideMenu) { item in
                NavigationLink(destination: destinationView(for: item, user: user)) {
                    Label(item.name, systemImage: item.icon)
                        .foregroundStyle(.primary)
                }
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack (alignment: .leading) {
                        Text("F I S I O")
                            .font(.largeTitle)
                        Text("By Linuxeros")
                            .foregroundStyle(.tertiary)
                    }
                }
                ToolbarItem {
                    Image("Logo")
                }
            }
        }
    }
}

    
func destinationView(for item: SideMenu, user: UserProfile) -> some View {
    switch item.name {
    case "Exercises":
        return AnyView(ExercisesView())
    case "Routine":
        return AnyView(RoutineView())
    case "Progress":
        return AnyView(ProgressView())
    case "Account":
        return AnyView(AccountView(user: user))
    case "Settings":
        return AnyView(SettingsView())
    default:
        return AnyView(EmptyView())
    }
}


struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        let user = UserProfile(username: "JohnDoe", email: "john.doe@example.com", weight: 75, height: 180, emergencyContact: "JaneDoe (+52 9381522681)", birthDate: Date(), gender: "Male", location: "New York")
        return SideBarView(user: user)
    }
}
