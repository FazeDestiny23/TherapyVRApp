//
//  ExercisesView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI

struct ExercisesView: View {
    @State private var searchText: String = ""
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    @Environment(\.presentationMode) var presentationMode
    @State private var isToolbarVisible = false
    @State private var selectedAlbum: Album? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 5) {
                            Text("Back to Menu")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.trailing)
                }
                
                TextField("Search in Exercises", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(albums) { album in
                        Button(action: {
                            isToolbarVisible = true
                            selectedAlbum = album
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
                                    .foregroundStyle(.tertiary)
                                    .lineLimit(1)
                            }
                            .hoverEffect()
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                VStack(alignment: .leading) {
                    Text("Therapies")
                        .font(.largeTitle)
                    Text("48 videos")
                        .foregroundStyle(.tertiary)
                }
            }
        }
        .toolbar {
            if isToolbarVisible {
                ToolbarItemGroup(placement: .bottomOrnament) {
                    HStack {
                        Button {} label: {
                            Image(systemName: "backward.fill")
                        }
                        Button {} label: {
                            Image(systemName: "pause.fill")
                        }
                        Button {} label: {
                            Image(systemName: "forward.fill")
                        }
                        if let album = selectedAlbum {
                            PlayingSong(album: album)
                        } else {
                            Text("No song selected")
                        }
                        Button {} label: {
                            Image(systemName: "speaker.wave.3.fill")
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}

struct PlayingSong: View {
    var album: Album?
    
    var body: some View {
        HStack {
            if let album = album {
                AsyncImage(url: URL(string: album.image)) { image in
                    image.resizable()
                } placeholder: {
                    Rectangle().foregroundStyle(.tertiary)
                }
                .frame(width: 48, height: 48)
                .cornerRadius(6)
                
                VStack(alignment: .leading) {
                    Text(album.title)
                    Text(album.subTitle)
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                }
                .frame(width: 160, alignment: .leading)
            } else {
                Text("No song selected")
            }
            
            Button(action: {
            }) {
                Image(systemName: "ellipsis")
            }
            .buttonBorderShape(.circle)
        }
        .padding(.all, 8)
        .background(.regularMaterial, in: .rect(cornerRadius: 14))
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
