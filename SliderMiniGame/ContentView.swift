//
//  ContentView.swift
//  SliderMiniGame
//
//  Created by Максим Кулагин on 20.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue = 0.0
    
    @State var targetValue = Int.random(in: 0...100)
    
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                
                Text("0")
                SliderView(currentValue: $currentValue)
                Text("100")
            }
            
            ButtonView(title: "Проверь меня!", action: {
                showAlert.toggle()
            })
            
            ButtonView(title: "Начать заново", action: {
                targetValue = Int.random(in: 0...100)
                currentValue = 0.0
            })
            
            .alert(computeScore().formatted(), isPresented: $showAlert, actions: {}) {
                Text("OOPS")
            }
        }
        .padding()
        
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
