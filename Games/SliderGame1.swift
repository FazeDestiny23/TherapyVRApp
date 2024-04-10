//
//  SliderGame1.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 10/04/24.
//

import SwiftUI

struct MultiDirectionalSlidersView: View {
    @State private var verticalSliderValues: [Double] = Array(repeating: 0.5, count: 3)
    @State private var horizontalSliderValues: [Double] = Array(repeating: 0.5, count: 3)
    let step: Double = 0.1

    var body: some View {
        VStack {
            Text("Vertical Sliders")
                .font(.headline)
            HStack(spacing: 20) {
                ForEach(0..<verticalSliderValues.count, id: \.self) { index in
                    VerticalSlider(value: $verticalSliderValues[index], step: step)
                }
            }
            .padding()

            Divider()

            Text("Horizontal Sliders")
                .font(.headline)
            VStack(spacing: 20) {
                ForEach(0..<horizontalSliderValues.count, id: \.self) { index in
                    HorizontalSlider(value: $horizontalSliderValues[index], step: step)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle("Multi-Directional Sliders")
    }
}

struct VerticalSlider: View {
    @Binding var value: Double
    let step: Double

    var body: some View {
        VStack {
            Button(action: {
                value = max(0, min(1, value + step))
            }) {
                Image(systemName: "arrow.up.circle")
            }
            Spacer()
            Slider(value: $value, in: 0...1)
                .rotationEffect(.degrees(-90))
                .frame(width: 100, height: 200)
            Spacer()
            Button(action: {
                value = max(0, min(1, value - step))
            }) {
                Image(systemName: "arrow.down.circle")
            }
        }
    }
}

struct HorizontalSlider: View {
    @Binding var value: Double
    let step: Double

    var body: some View {
        HStack {
            Button(action: {
                value = max(0, min(1, value - step))
            }) {
                Image(systemName: "arrow.left.circle")
            }
            Spacer()
            Slider(value: $value, in: 0...1)
                .frame(width: 200)
            Spacer()
            Button(action: {
                value = max(0, min(1, value + step))
            }) {
                Image(systemName: "arrow.right.circle")
            }
        }
    }
}

struct MultiDirectionalSlidersView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDirectionalSlidersView()
    }
}
