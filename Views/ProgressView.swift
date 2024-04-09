//
//  ProgressView.swift
//  UsuarioDatos
//
//  Created by FRANCISCO AQUINO on 11/03/24.
//

import SwiftUI
import SwiftUICharts

struct ProgressView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let strengthData: [Double] = [28, 45, 33, 14, 21, 38, 50, 12, 47, 36, 19, 42]
    let flexibilityData: [Double] = [1, 30, 44, 23, 39, 15, 48, 18, 27, 41, 20, 34]
    let mobilityData: [Double] = [13, 26, 37, 46, 24, 32, 49, 42, 18, 11, 35, 21]
    let painData: [Double] = [19, 45, 14, 31, 26, 38, 23, 47, 16, 36, 29, 41]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 40) {
                HStack(spacing: 100) {
                    VStack(alignment: .center, spacing: 40) {
                        Text("Strength")
                            .font(.title)
                        LineChartView(data: strengthData, title: "", legend: "Months", style: Styles.lineChartStyleOne)
                            .frame(height: 200)
                    }
                    VStack(alignment: .center, spacing: 40) {
                        Text("Flexibility")
                            .font(.title)
                        LineChartView(data: flexibilityData, title: "", legend: "Months", style: Styles.lineChartStyleOne)
                            .frame(height: 200)
                    }
                }
                HStack(spacing: 100) {
                    VStack(alignment: .center, spacing: 40) {
                        Text("Mobility")
                            .font(.title)
                        LineChartView(data: mobilityData, title: "", legend: "Months", style: Styles.lineChartStyleOne)
                            .frame(height: 200)
                    }
                    VStack(alignment: .center, spacing: 40) {
                        Text("Pain")
                            .font(.title)
                        LineChartView(data: painData, title: "", legend: "Months", style: Styles.lineChartStyleOne)
                            .frame(height: 200)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 30))
        }
        .navigationBarTitle("")
        .navigationBarItems(trailing:
            Button("Back to Menu") {
                presentationMode.wrappedValue.dismiss()
            }
        )
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
