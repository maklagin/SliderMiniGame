//
//  Slider.swift
//  SliderMiniGame
//
//  Created by Максим Кулагин on 20.09.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var currentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red.withAlphaComponent(1)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.delegate),
            for: .allEvents
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        @objc func delegate(sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(0))
    }
}
