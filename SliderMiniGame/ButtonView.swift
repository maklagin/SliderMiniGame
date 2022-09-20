//
//  ButtonView.swift
//  SliderMiniGame
//
//  Created by Максим Кулагин on 20.09.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Button", action: {})
    }
}
