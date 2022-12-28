//
//  SettingsView.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }){
                    GeneralButton(icon: "chevron.left")}
                Spacer()
            }
            .padding()
            
            Image("questionmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button(action: {}){
                SettingItem(icon: "questionmark", text: "Test", subText: "test")
                
            }
            Button(action: {}){
            SettingItem(icon: "questionmark", text: "Impact", subText: "test")
            }
            Button(action: {}){
            SettingItem(icon: "questionmark", text: "Settings")
            }
            Button(action: {}){
            SettingItem(icon: "questionmark", text: "Support")
            }
            Spacer()
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color.background)
        .foregroundColor(Color.white)
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct SettingItem: View {
    var icon: String
    var text: String
    var subText: String = ""
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            
            Image( systemName: icon)
                .imageScale(.large)
                .opacity(0.5)
            VStack(alignment: .leading, spacing: 6){
               Text(text)
                    .font(.headline)
                    .fontWeight(.semibold)
                if !subText.isEmpty {
                Text(subText)
                    .font(.footnote)
                    .opacity(0.5)
                }
            }
        }
        .foregroundColor(Color.white)
        .padding(.horizontal)
        .padding(.vertical,8)
    }
}
