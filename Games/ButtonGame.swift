//
//  ButtonGame.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 08/04/24.
//

import SwiftUI

struct ButtonGame: View {
    @State private var isPressed = false
    @State private var counter = 0
    @State private var buttonX: CGFloat = 0
    @State private var buttonY: CGFloat = 0
    
    let rectangleWidth: CGFloat = 800
    let rectangleHeight: CGFloat = 400
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("\(counter)")
                    .font(.system(size: 60, weight: .bold))
                    .opacity(isPressed ? 0.4 : 1.0)
                    .scaleEffect(isPressed ? 1.2 : 1.0)
                
                ZStack {
                    Rectangle()
                        .frame(width: rectangleWidth, height: rectangleHeight)
                        .foregroundColor(.clear)
                    
                    Capsule()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.blue)
                        .position(x: buttonX, y: buttonY)
                    
                    Text("Tap me!")
                        .foregroundColor(.white)
                        .position(x: buttonX, y: buttonY)
                }
                .opacity(isPressed ? 0.6 : 1.0)
                .scaleEffect(isPressed ? 1.1 : 1.0)
                .onAppear {
                    buttonX = geometry.size.width / 2
                    buttonY = geometry.size.height / 2
                }
                .onTapGesture {
                    counter += 1
                    generateRandomPosition(in: geometry.size)
                }
                .pressEvents {
                    withAnimation(.easeIn(duration: 0.2)) {
                        isPressed = true
                    }
                } onRelease: {
                    withAnimation {
                        isPressed = false
                    }
                }
            }
        }
    }
    
    func generateRandomPosition(in size: CGSize) {
        let cellWidth = rectangleWidth / 10
        let cellHeight = rectangleHeight / 10
        
        let randomCellX = CGFloat.random(in: 0..<10)
        let randomCellY = CGFloat.random(in: 0..<10)
        
        var randomXWithinCell = CGFloat.random(in: 0..<cellWidth)
        var randomYWithinCell = CGFloat.random(in: 0..<cellHeight)
        
        randomXWithinCell = min(randomXWithinCell, cellWidth - 50)
        randomYWithinCell = min(randomYWithinCell, cellHeight - 50)
        
        buttonX = (CGFloat(randomCellX) * cellWidth) + randomXWithinCell + (size.width - rectangleWidth) / 4
        buttonY = (CGFloat(randomCellY) * cellHeight) + randomYWithinCell + (size.height - rectangleHeight) / 4
        
        buttonX = max(buttonX, 0)
        buttonY = max(buttonY, 0)
        buttonX = min(buttonX, size.width - 50)
        buttonY = min(buttonY, size.height - 50)
    }
}

struct ButtonGame_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGame()
    }
}
