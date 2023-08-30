//
//  ContentView.swift
//  Restart
//
//  Created by Taewon Yoon on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
    // AppStorage는 특별한 SwiftUI 프로퍼티 래퍼로 user's default를 underthe hood에서 사용할 수 있도록 해준다.
    // AppStorage를 사용하면 기기에 영구적으로 값을 저장할 수 있다.
    // onboarding은 고유키 이름이다 // isOnboardingViewActive은 swiftUI파일에서 사용되는 변수 이름이다.
    // 이 코드를 사용하여 앱 설치 후 처음으로 싫행하였을때 동작하는 코드를 작동시키기 위해서 사용될 수 있다.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
