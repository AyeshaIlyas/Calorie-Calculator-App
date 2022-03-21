//
//  CalorieCalculatorTabView.swift
//  CalorieCalculator
//
//  Created by Ayesha Ilyas on 3/21/22.
//

import SwiftUI

struct CalorieCalculatorTabView: View {
    var body: some View {
        TabView {
            PersonalInformationView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Personal Info")
                    }
                }
            
            Text("Tab two")
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                        Text("Exercise Info")
                    }
                }
            
            Text("Tab three")
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Calculate Calories")
                    }
                }
        }.environmentObject(CalorieCalculatorModel())
    }
}

struct CalorieCalculatorTabView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieCalculatorTabView()
    }
}
