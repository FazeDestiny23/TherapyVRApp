//
//  ExercisesView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI

struct ExercisesView: View {
    @State private var selectedAlbum: Album? = nil
    @State private var isButtonGameViewPresented = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160, maximum: 200))]) {
                ForEach(albums) { album in
                    Button(action: {
                        selectedAlbum = album
                        isButtonGameViewPresented = true
                    }) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: album.image)) { image in
                                image.resizable()
                            } placeholder: {
                                Rectangle().foregroundStyle(.tertiary)
                            }
                            .aspectRatio(1, contentMode: .fill)
                            .scaledToFit()
                            .cornerRadius(10)
                            
                            Text(album.title)
                                .lineLimit(1)
                            Text(album.subTitle)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $isButtonGameViewPresented) {
            ButtonGame()
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
