//
//  passwordResetView.swift
//  mytimetablemakers_swiftui
//
//  Created by 中島正雄 on 2021/03/10.
//

import SwiftUI
import FirebaseAuth

struct passwordResetView: View {
              
    @ObservedObject private var loginviewmodel: LoginViewModel
    
    init(
        _ loginviewmodel: LoginViewModel
    ) {
        self.loginviewmodel = loginviewmodel
    }

    @State private var isShowingAlert = false
    @State private var isSendEmail = false
    @State private var title = ""
    @State private var message = ""
    
    var body: some View {
        Button(action: {
            isShowingAlert = true
        }) {
            ZStack(alignment: .top) {
                Text("Forgot Password?".localized)
                    .underline(color: Color.white)
                    .font(.headline)
                    .foregroundColor(.white)
//                passwordResetAlertView(
//                    email: $loginviewmodel.email,
//                    isShowingAlert: $isShowingAlert,
//                    isSendEmail: $isSendEmail,
//                    title: $title,
//                    message: $message
//                )
//                .alert(isPresented: $isSendEmail) {
//                    Alert(
//                        title: Text(title),
//                        message: Text(message)
//                    )
//                }
            }.frame(height: 25)
        }
    }
}

struct passwordResetView_Previews: PreviewProvider {
    static var previews: some View {
        let loginviewmodel = LoginViewModel()
        passwordResetView(loginviewmodel)
            .background(Color.black)
    }
}

