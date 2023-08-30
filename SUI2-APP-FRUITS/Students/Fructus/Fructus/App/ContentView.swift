//
//  ContentView.swift
//  Fructus
//
//  Created by Taewon Yoon on 2023/08/26.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var fruit: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruit.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            }))
            .sheet(isPresented: $isShowingSettings) {
                SettingView()
            }
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruit: fruitsData)
    }
}
