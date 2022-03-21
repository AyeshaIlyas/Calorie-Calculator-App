//
//  CalorieCalculatorModel.swift
//  CalorieCalculator
//
//  Created by Ayesha Ilyas on 3/21/22.
//

import Foundation

class CalorieCalculatorModel: ObservableObject {
    let genders = ["Female", "Male"]
    var age:Int?
    var weight:Double? // in lbs
    var gender:String?
    
    var exerciseDuration:Double? // in minutes
    var avgHeartRate:Int?
    
    func calculateCalories() -> Double? {
        if let g = gender, let a = Double(age!), let w = weight, let ed = exerciseDuration, let ahr = Double(avgHeartRate!) {
            if gender == "Female" {
                return ((age * 0.074) - (weight * 0.05741) + (avgHeartRate * 0.4472) - 20.4022) * (exerciseDuration / 4.184)
            } else if gender == "Male" {
                return ((age * 0.2017) - (weight * 0.09036) + (avgHeartRate * 0.6309) - 20.4022) * (exerciseDuration / 55.0969)
            }
       // unset values
        return nil
    }
    
    
}
