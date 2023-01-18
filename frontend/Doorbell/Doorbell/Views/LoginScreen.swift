//
//  LoginScreen.swift
//  Doorbell
//
//  Created by Cora Bleier on 14.12.22.
//

import SwiftUI

struct LoginScreen: View {@EnvironmentObject var vm: UserStateViewModel
    @State var email = ""
    @State var password = ""

    fileprivate func EmailInput() -> some View {
        TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
            .background(Color.gray)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
    }

    fileprivate func PasswordInput() -> some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color.gray)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
    }

    fileprivate func LoginButton() -> some View {
        Button(action: {
            Task {
                await vm.signIn(
                    email: email,
                    password:password
                )
            }
        }) {
            LoginButtonContent()
        }
    }

    var body: some View {

        VStack{
            if(vm.isBusy){
                ProgressView()
            }else{
                WelcomeText()
                ImageView()
                    .padding(.bottom, 75)
                EmailInput()
                PasswordInput()
                LoginButton()
            }
        }.padding()

    }
}

struct LoginScreen_Previews: PreviewProvider {
    static let userStateViewModel = UserStateViewModel()
    
    static var previews: some View {
        LoginScreen()
            .environmentObject(userStateViewModel)
    }
}
