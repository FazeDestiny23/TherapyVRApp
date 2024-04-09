//
//  ButtonGame.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 08/04/24.
//

import SwiftUI

struct ButtonGame1: View {
    @State private var isPressed = false
    @State private var counter = 0
    @State private var buttonX: CGFloat = 0
    @State private var buttonY: CGFloat = 0
    @State private var lastPressTime: Date?
    @State private var buttonColor = Color.blue
    @State private var timerIsFinished = false
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    @State private var isPresentingContentView = false
    
    let rectangleWidth: CGFloat = 800
    let rectangleHeight: CGFloat = 400
    let timerDuration: TimeInterval = 60.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("\(counter) Points")
                        .font(.system(size: 24))
                        .padding()
                    Spacer()
                    Text("\(timeRemaining) seconds")
                        .font(.system(size: 24))
                        .padding()
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: rectangleWidth, height: rectangleHeight)
                        .foregroundColor(.clear)
                    
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(buttonColor)
                        .position(x: buttonX, y: buttonY)
                        .opacity(isPressed ? 0.6 : 1.0)
                        .animation(.easeInOut(duration: 0.2))
                    
                    Text("Tap me")
                        .foregroundColor(.white)
                        .position(x: buttonX, y: buttonY)
                }
                .scaleEffect(isPressed ? 1.1 : 1.0)
                .onAppear {
                    resetButtonPosition(in: geometry.size)
                }
                .onTapGesture {
                    if timer == nil {
                        startTimer()
                    }
                    counter += 1
                    let currentTime = Date()
                    if let lastTime = lastPressTime {
                        let timeDifference = currentTime.timeIntervalSince(lastTime)
                        print("Reaction Time: \(String(format: "%.2f", timeDifference)) seconds")
                    }
                    lastPressTime = currentTime
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
            .alert(isPresented: $timerIsFinished) {
                Alert(
                    title: Text("Training Completed"),
                    message: Text("Your score: \(counter) Points"),
                    primaryButton: .default(Text("Try Again")) {
                        counter = 0
                        timeRemaining = Int(timerDuration)
                        timer?.invalidate()
                        timer = nil
                        resetButtonPosition(in: geometry.size)
                    },
                    secondaryButton: .default(Text("Go to main menu")) {
                        isPresentingContentView = true
                    }
                )
            }
            .fullScreenCover(isPresented: $isPresentingContentView) {
                ContentView()
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
        
        buttonColor = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
    
    func resetButtonPosition(in size: CGSize) {
        buttonX = size.width / 2
        buttonY = size.height / 2
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timerIsFinished = true
                timer?.invalidate()
                timer = nil
            }
        }
    }
}

struct ButtonGame_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGame1()
    }
}
