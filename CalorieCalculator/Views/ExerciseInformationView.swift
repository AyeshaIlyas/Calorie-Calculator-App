//
//  ExerciseInformationView.swift
//  CalorieCalculator
//
//  Created by Ayesha Ilyas on 3/21/22.
//

import SwiftUI

struct ExerciseInformationView: View {
    @EnvironmentObject var model: CalorieCalculatorModel
    @State var duration:String = ""
    @State var heartRate:String = ""
    @State var showError = false
    @FocusState private var durationIsFocused: Bool
    @FocusState private var ahrIsFocused: Bool
    var body: some View {
        VStack (spacing: 20) {
            Text("Exercise Information")
                .font(.largeTitle)
            
            HStack (spacing: 20) {
                Spacer()
                Text("Exercise Duration (min):")
                TextField("Enter your workout duration", text: $duration)
                    .keyboardType(.decimalPad)
                    .focused($durationIsFocused)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 300.0)
                    
                Spacer()
            }
            
            HStack (spacing: 20) {
                Spacer()
                Text("Avg. Heart Rate:")
                TextField("Enter your heart rate", text: $heartRate)
                    .keyboardType(.decimalPad)
                    .focused($ahrIsFocused)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 300.0)
                Spacer()
            }
            
            if (showError) {
                Text("Invalid inputs. Please enter a valid time in minutes  and average heart rate.")
                    .foregroundColor(Color.red)
                    .padding()
            }
            
            Button(action: {
                // save valid information to viewmodel object
                if duration == "" || heartRate == "" {
                    showError = true
                } else {
                    showError = false
                    model.exerciseDuration = Double(duration)
                    model.avgHeartRate = Int(heartRate)
                    durationIsFocused = false
                    ahrIsFocused = false
                }
            }) {
                Text("Submit")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.blue)
                    .cornerRadius(10.0)
            }
            
        }
    }
}

struct ExerciseInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseInformationView()
    }
}
