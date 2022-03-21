//
//  CalculateCaloriesView.swift
//  CalorieCalculator
//
//  Created by Ayesha Ilyas on 3/21/22.
//

import SwiftUI

struct CalculateCaloriesView: View {
    @EnvironmentObject var model: CalorieCalculatorModel
    @State var caloriesBurnedString = "0 calories burned"
    var body: some View {
        
        VStack (spacing: 20) {
            Button(action: {
                let caloriesBurned = model.calculateCalories()
                if let cb = caloriesBurned {
                    caloriesBurnedString = "\(Int(cb)) calories burned"
                }
                
            }) {
                Text("Calculate")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding(.vertical)
                    .padding(.horizontal, 35)
                    .background(Color.blue)
                    .cornerRadius(10.0)
            }
            
            Text(caloriesBurnedString)
        }
    }
}

struct CalculateCaloriesView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateCaloriesView()
    }
}
