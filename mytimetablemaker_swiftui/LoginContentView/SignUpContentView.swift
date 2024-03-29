//
//  signUpView.swift
//  mytimetablemakers_swiftui
//
//  Created by 中島正雄 on 2021/03/12.
//

import SwiftUI
import FirebaseAuth
import GoogleMobileAds

struct SignUpContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var myLogin: MyLogin
    @State private var isSignUpAlert = false

    init(
        _ myLogin: MyLogin
    ) {
        self.myLogin = myLogin
    }

    var body: some View {
        VStack(spacing: loginMargin) {
            //Title
            Text("Create Account".localized)
                .font(.system(size: loginTitleFontSize))
                .fontWeight(.bold)
                .foregroundColor(Color.primaryColor)
                .padding(.top, loginTitleTopMargin)
                .padding(.bottom, loginTitleBottomMargin)
            //Email textfield
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(loginTextCornerRadius)
                    .frame(height: loginTextHeight)
                TextField("Email".localized, text: $myLogin.email)
                    .font(.subheadline)
                    .lineLimit(1)
                    .padding()
                    .onChange(of: myLogin.email) { _ in myLogin.signUpCheck() }
            }.frame(width: loginButtonWidth)
            //Password textfield
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(loginTextCornerRadius)
                    .frame(height: loginTextHeight)
                SecureField("Password (8+ chars: alnum & !@#$&~)".localized, text: $myLogin.password)
                    .font(.subheadline)
                    .lineLimit(1)
                    .padding()
                    .onChange(of: myLogin.password) { _ in myLogin.signUpCheck() }
            }.frame(width: loginButtonWidth)
            //Confirm password textfield
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(loginTextCornerRadius)
                    .frame(height: loginTextHeight)
                SecureField("Confirm Password".localized, text: $myLogin.passwordConfirm)
                    .font(.subheadline)
                    .lineLimit(1)
                    .padding()
                    .onChange(of: myLogin.passwordConfirm) { _ in myLogin.signUpCheck() }
            }.frame(width: loginButtonWidth).padding(.bottom, 6)
            //Sign up button
            Button(action: myLogin.signUp) {
                ZStack {
                    Text("Signup".localized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: loginButtonWidth, height: loginButtonHeight)
                        .background(myLogin.isValidSignUp ? Color.primaryColor: Color.grayColor)
                        .cornerRadius(loginButtonCornerRadius)
                    if myLogin.isLoading {
                        ProgressView().progressViewStyle(CircularProgressViewStyle())
                    }
                } .padding(.bottom, 6)
            }.alert(myLogin.alertTitle, isPresented: $myLogin.isShowMessage) {
                Button(textOk, role: .none){
                    myLogin.isShowMessage = false
                    if myLogin.isSignUpSuccess {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            } message: {
                Text(myLogin.alertMessage)
            }
            //Terms checkbox
            HStack {
                //Checkbox
                Button(action: myLogin.toggle) {
                    Image(systemName: myLogin.isTermsAgree ? "checkmark.square.fill": "square")
                        .foregroundColor(myLogin.isTermsAgree ? Color.primaryColor: .white)
                        .padding(10)
                }
                //Terms link
                Button(action: {
                    if let termsURL = URL(string: termslink) {
                        UIApplication.shared.open(termsURL, options: [:], completionHandler: nil)
                    }
                }) {
                    (
                        Text("I have read and agree to the ".localized)
                        + Text("terms and privacy policy".localized).underline(color: Color.white)
                        + Text("kakunin".localized)
                    )
                    .font(.subheadline)
                    .foregroundColor(.white)
                }
            }
            .frame(width: loginButtonWidth, height: 40 ,alignment: .top)

            Spacer()

            //Admob
            AdMobBannerView()
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.accentColor)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let myLogin = MyLogin()
        SignUpContentView(myLogin)
    }
}

