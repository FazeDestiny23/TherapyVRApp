//
//  RoutineView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI

struct RoutineView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Button("Back to Menu") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding(.trailing)
                }
                
                ExerciseLogView(date: "2024-03-10", duration: "45 minutes", exercise: "Race", progress: 0.5)
                ExerciseLogView(date: "2024-03-08", duration: "30 minutes", exercise: "Weightlifting", progress: 0.3)
                ExerciseLogView(date: "2024-03-06", duration: "60 minutes", exercise: "Yoga", progress: 0.7)
                ExerciseLogView(date: "2024-03-04", duration: "40 minutes", exercise: "Motor control techniques", progress: 0.4)
            }
            .padding()
        }
    }
}

struct ExerciseLogView: View {
    let date: String
    let duration: String
    let exercise: String
    @State private var progress: CGFloat
    
    init(date: String, duration: String, exercise: String, progress: CGFloat) {
        self.date = date
        self.duration = duration
        self.exercise = exercise
        self._progress = State(initialValue: progress)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Exercise log:")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Date: \(date)")
                    .font(.body)
                    .foregroundColor(.secondary)
                Text("Duration: \(duration)")
                    .font(.body)
                    .foregroundColor(.secondary)
                Text("Exercise: \(exercise)")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button("Start Training") {
            }
            .padding(20)
            .foregroundColor(.white)
        }
        
        ProgressBar(progress: $progress)
            .frame(height: 5)
    }
}

struct ProgressBar: View {
    @Binding var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(width: geometry.size.width / 3, height: 5)
                    .cornerRadius(2.5)
                    .padding(.vertical, 5)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: min(self.progress * (geometry.size.width / 3), geometry.size.width / 3), height: 5)
                    .cornerRadius(2.5)
                    .padding(.vertical, 5)
            }
        }
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView()
    }
}
