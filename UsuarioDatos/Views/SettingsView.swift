//
//  SettingsView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI

struct AppTheme: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let primaryColor: Color
    let secondaryColor: Color
}

let themes: [AppTheme] = [
    AppTheme(name: "Light", primaryColor: .white, secondaryColor: .blue),
    AppTheme(name: "Dark", primaryColor: .black, secondaryColor: .yellow),
    AppTheme(name: "Custom", primaryColor: .green, secondaryColor: .purple)
]

struct Language: Hashable {
    let id: Int
    let name: String
}

let languages: [Language] = [
    Language(id: 1, name: "English"),
    Language(id: 2, name: "Spanish"),
]

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedLanguage = languages[0]
    @State private var selectedTheme: AppTheme = themes[0]
    @State private var isVibrationEnabled = true
    @State private var soundVolume: Double = 0.5
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back to Menu")
                        .foregroundColor(.white)
                        .padding()
                }
                .padding(.trailing)

            }
            
            VStack(alignment: .leading) {
                Text("Select a Theme:")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Picker(selection: $selectedTheme, label: Text("")) {
                    ForEach(themes, id: \.id) { theme in
                        Text(theme.name).tag(theme)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 20)
            }
            
            VStack(alignment: .leading) {
                Text("Select a Language:")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Picker(selection: $selectedLanguage, label: Text("")) {
                    ForEach(languages, id: \.id) { language in
                        Text(language.name).tag(language)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 20)
            }
            
            VStack(alignment: .leading) {
                Text("Volume:")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Slider(value: $soundVolume, in: 0...1, step: 0.1)
                    .padding(.bottom, 20)
            }
            
            VStack(alignment: .leading) {
                Text("Vibration:")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Toggle("Enabled / Not Enabled", isOn: $isVibrationEnabled)
                    .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
