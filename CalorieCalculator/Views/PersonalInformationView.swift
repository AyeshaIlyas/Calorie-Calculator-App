//
//  PersonalInformationView.swift
//  CalorieCalculator
//
//  Created by Ayesha Ilyas on 3/21/22.
//

import SwiftUI

struct PersonalInformationView: View {
    @EnvironmentObject var model: CalorieCalculatorModel
    @State var age:String = ""
    @State var weight:String = ""
    @State var showError = false
    var body: some View {
        VStack (spacing: 20){
            Text("Personal Information")
                .font(.largeTitle)
            HStack (spacing: 20) {
                Spacer()
                Text("Age:")
                TextField("Enter your age", text: $age)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 300.0)
                    
                Spacer()
            }
            
            HStack (spacing: 20) {
                Spacer()
                Text("Weight (lbs):")
                TextField("Enter your weight", text: $weight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 300.0)
                Spacer()
            }
            
            Picker("Gender", selection: $model.gender) {
                ForEach (model.genders, id: \.self) { g in
                    Text(g)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
            
            if (showError) {
                Text("Invalid inputs. Please enter a valid age and weight.")
                    .foregroundColor(Color.red)
            }
            
            Button(action: {
                // save valid information to viewmodel object
                if age == "" || weight == "" {
                    showError = true
                } else {
                    showError = false
                    model.age = Int(age)
                    model.weight = Double(weight)
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

struct PersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInformationView()
    }
}
