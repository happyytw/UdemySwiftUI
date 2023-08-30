//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Taewon Yoon on 2023/08/29.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fruitus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
