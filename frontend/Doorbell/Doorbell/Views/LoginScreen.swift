//
//  LoginScreen.swift
//  Doorbell
//
//  Created by Cora Bleier on 14.12.22.
//

import SwiftUI

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}


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

struct LoginScreen_Previews: PreviewProvider {
    static let userStateViewModel = UserStateViewModel()
    
    static var previews: some View {
        LoginScreen()
            .environmentObject(userStateViewModel)
    }
}
