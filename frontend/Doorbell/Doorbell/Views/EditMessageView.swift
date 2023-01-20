//
//  EditMessageView.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI

struct EditMessageView: View {
    @State private var profileText = "Message that will be displayed:"
    
    /// - TODO: Save message Text
    var body: some View {
        NavigationStack {
                    TextEditor(text: $profileText)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                        .navigationTitle("This is your Message: ")
                }
    }
}

struct EditMessageView_Previews: PreviewProvider {
    static var previews: some View {
        EditMessageView()
    }
}
