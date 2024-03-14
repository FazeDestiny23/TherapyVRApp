//
//  SideMenu.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import Foundation

struct SideMenu: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var icon: String
}

let sideMenu: [SideMenu] = [
    SideMenu(name: "Exercises", icon: "dumbbell"),
    SideMenu(name: "Routine", icon: "clock"),
    SideMenu(name: "Progress", icon: "chart.bar"),
    SideMenu(name: "Account", icon: "person.crop.square"),
    SideMenu(name: "Settings", icon: "gear"),
]
