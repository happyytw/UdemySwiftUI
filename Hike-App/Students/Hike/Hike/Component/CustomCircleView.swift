//
//  CustomCircleView.swift
//  Hike
//
//  Created by Taewon Yoon on 2023/08/17.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [
                        .customIndigoMedium,
                        .customSalmonLight
                    ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                        isAnimateGradient.toggle() // true->false, false->true로 바꿔준다.
                    }
                }
            
            MotionAnimationView()
        } //: ZSTACK
        .frame(width: 256, height: 256)
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
