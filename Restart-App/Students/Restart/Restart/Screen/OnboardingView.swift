//
//  OnboardingView.swift
//  Restart
//
//  Created by Taewon Yoon on 2023/08/18.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    // 다시 프로퍼티를 새로 선언한 것 같지만 아니다. true는 onboarding이라는 key의 값이 없을 경우에만 값이 넣어진다.
    // 즉 기존에 선언한 값이 있으면 초기화를 무시하고 기존 값이 없었더라면 초기화를 실행한다.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80 // 아이폰마다 크기가 다 제각각이기 떄문에
    @State private var buttonOffset: CGFloat = 0 // 수평의 위치를 나타낸다.
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero //CGSize(width: 0, height: 0)
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    let hapticFeetback = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .transition(.opacity)
                    
                    Text("""
                    It's not how much we gibe but how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if abs(imageOffset.width) <= 150 {
                                    imageOffset = gesture.translation
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 0
                                        textTitle = "Give."
                                    }
                                }
                            })
                            .onEnded({ _ in
                                imageOffset = .zero
                                
                                withAnimation(.linear(duration: 0.25)) {
                                    indicatorOpacity = 1
                                    textTitle = "Share."
                                }
                            })
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                } //: CENTER
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    , alignment: .bottom
                )
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // 1. BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    // 4. CIRCLE (DRAGGABLE)
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 25, weight: .bold))
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset) // 값이 바뀌면 자동으로 View를 업데이트한다
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 { // 오른쪽 방향으로만 움직였을 경우 시작된다.
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded({ _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth /  2 {
                                            hapticFeetback.notificationOccurred(.success)
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            hapticFeetback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        )
                        
                        Spacer()
                    } //: HSTACK

                } //: FOOTER
                .frame(width: buttonWidth , height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
