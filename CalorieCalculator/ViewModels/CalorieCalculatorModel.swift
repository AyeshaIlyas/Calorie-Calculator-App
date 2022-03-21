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
    var gender:String = "Female"
    
    var exerciseDuration:Double? // in minutes
    var avgHeartRate:Int?
    
    func calculateCalories() -> Double? {
        if let a = age, let w = weight, let ed = exerciseDuration, let ahr = avgHeartRate {
            if gender == "Female" {
                return ((Double(a) * 0.074) - (w * 0.05741) + (Double(ahr) * 0.4472) - 20.4022) * (ed / 4.184)
            } else if gender == "Male" {
                return ((Double(a) * 0.2017) - (w * 0.09036) + (Double(ahr) * 0.6309) - 20.4022) * (ed / 55.0969)
            }
        }
       // unset values
        return nil
    }
    
    
}
