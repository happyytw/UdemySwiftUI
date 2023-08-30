//
//  FruitCardView.swift
//  Fructus
//
//  Created by Taewon Yoon on 2023/08/27.
//

import SwiftUI

struct FruitCardView: View {
    // MARK: PROPERTIES
    
    var fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    // MARK: BODY
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) { // spacing: 내부 간격 설정
                // FRUIT: IMAGE
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15) ,radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6) // 0.6에서 1.0으로 크기가 점점 커지는 효과
                // FRUIT: TITLE
                
                Text(fruit.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                // FRUIT: HEADLINE
                Text(fruit.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                // BUTTON: START
                StartButtonView()
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        })
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

// MARK: PREVIEW

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
