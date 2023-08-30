//
//  SettingView.swift
//  Fructus
//
//  Created by Taewon Yoon on 2023/08/29.
//

import SwiftUI

struct SettingView: View {
    // MARK: PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    //  MAKR: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    
                    GroupBox(label: HStack {
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                        
                    }) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cho")
                                .font(.footnote)
                        }
                    }
                    
                    // MARK: - SECTION 2
                    
                    GroupBox(content: {
                        Divider().padding(.vertical, 4)
                        
                        Text("만약 당신이 스위치를 누름으로서 재시작을 원한다면 눌러라")
                            .padding(.vertical, 8)
                            .frame(height: 60)
                            .layoutPriority(1) // 우선순위를 1위로 둬서 글이 누락되는 일을 방지한다.
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }) {
                        SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")

                    }


                    
                    // MARK: - SECTION 3
                    
                    GroupBox {
                        SettingsRowView(name: "Developer", content: "John / Jane")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } label: {
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    }
                } //: VSTACK
                .navigationTitle(Text("Settings"))
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .padding()
            } //: SCROLL
        } // NAVIGATION
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
