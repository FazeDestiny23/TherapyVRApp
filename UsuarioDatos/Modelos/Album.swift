//
//  Album.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import Foundation
import SwiftUI

struct Album: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var subTitle: String
    var albumDetailView: AnyView
}

let albums: [Album] = [
    Album(image: "https://indierocks.sfo3.digitaloceanspaces.com/wp-content/uploads/2020/10/Wos_caravana_portada.jpg", title: "CARAVANA", subTitle: "WOS", albumDetailView: AnyView(ButtonGame1())),
    Album(image: "https://i.scdn.co/image/ab67616d0000b273661d019f34569f79eae9e985", title: "Plastic Beach", subTitle: "Gorillaz", albumDetailView: AnyView(ButtonGame1())),
    Album(image: "https://i.scdn.co/image/ab67616d0000b273548f7ec52da7313de0c5e4a0", title: "YHLQMDLG", subTitle: "Bad Bunny", albumDetailView: AnyView(ButtonGame1())),
    Album(image: "https://www.lahiguera.net/musicalia/artistas/varios/disco/12974/duki_antes_de_ameri-portada.jpg", title: "ADA", subTitle: "Duki", albumDetailView: AnyView(ButtonGame1())),
    Album(image: "https://www.lahiguera.net/musicalia/artistas/varios/disco/11638/tainy_data-portada.jpg", title: "DATA", subTitle: "Tainy", albumDetailView: AnyView(ButtonGame1())),
    Album(image: "https://www.lahiguera.net/musicalia/artistas/imagine_dragons/disco/8369/imagine_dragons_evolve-portada.jpg", title: "Evolve", subTitle: "Imagine Dragons", albumDetailView: AnyView(ButtonGame1())),
]
