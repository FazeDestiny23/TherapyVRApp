//
//  ContentView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    let user = UserProfile(username: "JohnDoe", email: "john.doe@example.com", weight: 75, height: 180, emergencyContact: "JaneDoe (+52 9381522681)", birthDate: Date(), gender: "Male", location: "New York")
    
    var body: some View {
        TabView {
            NavigationSplitView {
                SideBarView(user: user)
            } detail: {}
            
            ExercisesView()
            .tabItem {
                Label ("Exercises", systemImage: "dumbbell")
            } .tag(0)
            
            RoutineView()
                .tabItem {
                    Label ("Routine", systemImage: "clock")
                } .tag(1)
            
            ProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar")
                } .tag(2)
            
            AccountView(user: UserProfile(username: "JohnDoe", email: "john.doe@example.com", weight: 75, height: 180, emergencyContact: "JaneDoe (+52 9381522681)", birthDate: Date(), gender: "Male", location: "New York"))
                .tabItem {
                    Label("Account", systemImage: "person.crop.square")
                } .tag(3)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                } .tag(4)
        }
    }
}


#Preview() {
    ContentView()
}
