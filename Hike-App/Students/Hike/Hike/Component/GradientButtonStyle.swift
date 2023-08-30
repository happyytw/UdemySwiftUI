//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Taewon Yoon on 2023/08/17.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle { // ButtonStyle은 SwiftUI 프로토콜이다.    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)

            )
            .cornerRadius(40)
    }
}
