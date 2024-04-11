//
//  SliderGame1.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 10/04/24.
//

import SwiftUI

struct SliderGame1: View {
    @State private var spacing: CGFloat = 20
    @State private var counter = 0
    @State private var totalProgress = 0
    @State private var timer: Timer?
    @State private var timeRemaining = 60
    @State private var timerIsFinished = false
    @State private var isPresentingContentView = false

    var body: some View {
        VStack {
            HStack(spacing: spacing) {
                VStack {
                    Spacer()
                    HStack {
                        Sliders(maxWidth: 400, isVertical: true, updateProgress: updateProgress)
                            .padding(10)
                        Sliders(maxWidth: 400, isVertical: true, updateProgress: updateProgress)
                        Sliders(maxWidth: 400, isVertical: true, updateProgress: updateProgress)
                            .padding(10)
                    }
                    Spacer()

                }
                .padding(.trailing, spacing / 2)

                VStack {
                    Spacer()
                    VStack {
                        Sliders(maxWidth: 400, isVertical: false, updateProgress: updateProgress)
                            .padding(20)
                        Sliders(maxWidth: 400, isVertical: false, updateProgress: updateProgress)
                        Sliders(maxWidth: 400, isVertical: false, updateProgress: updateProgress)
                            .padding(20)
                    }
                    Spacer()
                }
            }

            Text("Time: \(timeRemaining)")
                .font(.headline)
                .padding()
        }
        .onAppear {
            startTimer()
        }
        .alert(isPresented: $timerIsFinished) {
            Alert(
                title: Text("Training Completed"),
                message: Text("Your score: \(counter) Points"),
                primaryButton: .default(Text("Try Again")) {
                    resetGame()
                },
                secondaryButton: .default(Text("Go to Main Menu")) {
                    isPresentingContentView = true
                }
            )
        }
        .fullScreenCover(isPresented: $isPresentingContentView) {
            ContentView()
        }
    }

    func updateProgress(progress: CGFloat) {
        totalProgress += Int(progress * 100)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
                counter = totalProgress
            } else {
                timer?.invalidate()
                timerIsFinished = true
            }
        }
    }

    func resetGame() {
        counter = 0
        totalProgress = 0
        timeRemaining = 60
        timer?.invalidate()
        timer = nil
        startTimer()
    }
}

struct Sliders: View {
    var maxWidth: CGFloat
    var isVertical: Bool
    var updateProgress: (CGFloat) -> Void

    @State private var sliderProgress: CGFloat = 0
    @State private var sliderSize: CGSize = .zero
    @State private var lastDragValue: CGFloat = 0

    var body: some View {
        if isVertical {
            VStack {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color("b"))
                        .frame(width: 100, height: maxWidth)

                    Rectangle()
                        .fill(Color("a"))
                        .frame(width: 100, height: sliderSize.height)
                }
                .cornerRadius(35)
                .overlay(
                    Text("\(Int(sliderProgress * 100))%")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical, 30)
                )
                .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                    let translation = value.translation
                    sliderSize.height = -translation.height + lastDragValue
                    sliderSize.height = sliderSize.height > maxWidth ? maxWidth : sliderSize.height
                    sliderSize.height = sliderSize.height >= 0 ? sliderSize.height : 0
                    let progress = sliderSize.height / maxWidth
                    sliderProgress = progress <= 1.0 ? progress : 1
                }).onEnded({ (value) in
                    sliderSize.height = sliderSize.height > maxWidth ? maxWidth : sliderSize.height
                    sliderSize.height = sliderSize.height >= 0 ? sliderSize.height : 0
                    lastDragValue = sliderSize.height
                    updateProgress(sliderProgress)
                }))
            }
        } else {
            HStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color("b"))
                        .frame(width: maxWidth, height: 100)

                    Rectangle()
                        .fill(Color("a"))
                        .frame(width: sliderSize.width, height: 100)
                }
                .cornerRadius(35)
                .overlay(
                    Text("\(Int(sliderProgress * 100))%")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                )
                .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                    let translation = value.translation
                    sliderSize.width = lastDragValue + translation.width
                    sliderSize.width = sliderSize.width > maxWidth ? maxWidth : sliderSize.width
                    sliderSize.width = sliderSize.width >= 0 ? sliderSize.width : 0
                    let progress = sliderSize.width / maxWidth
                    sliderProgress = progress <= 1.0 ? progress : 1
                }).onEnded({ (value) in
                    sliderSize.width = sliderSize.width > maxWidth ? maxWidth : sliderSize.width
                    sliderSize.width = sliderSize.width >= 0 ? sliderSize.width : 0
                    lastDragValue = sliderSize.width
                    updateProgress(sliderProgress)
                }))
            }
        }
    }
}

struct SliderGame1_Previews: PreviewProvider {
    static var previews: some View {
        SliderGame1()
    }
}
