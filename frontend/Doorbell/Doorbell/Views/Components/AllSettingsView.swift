//
//  AllSettingsView.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct AllSettingsView: View {
    var body: some View {
        VStack {
            ActionViewHeader(title: "All Settings")
            LazyVGrid(columns: [GridItem(.fixed(170)),GridItem(.fixed(170))]) {
                NavigationLink(destination: ControlsView()) {
                    Image(systemName: "bell.fill")
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                    
                    Button(action: {}){
                        Image(systemName: "gearshape.fill")
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                        
                    }
                }
            }
        }
    }
}

struct AllSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AllSettingsView()
    }
}
