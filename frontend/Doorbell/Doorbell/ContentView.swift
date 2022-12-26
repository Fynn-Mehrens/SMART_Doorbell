//
//  ContentView.swift
//  Doorbell
//
//  Created by Cora Bleier on 14.12.22.
//

import SwiftUI

struct ContentView: View {
    /// The horizontal size class of the current device.
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    // Reference to the divice size category class.
    @Environment(\.deviceSizeClass) var category
    /// Is the user ready to leave the welcome screen?
    @State private var ready: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            WelcomeText()
            ImageView()
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            Button(action: {print("Button tapped")}){
                LoginButtonContent()
            }
        }
        .padding()
    }
}

struct WelcomeText: View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
        
    }
}

struct ImageView: View {
    var body: some View {
        return Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(15.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
