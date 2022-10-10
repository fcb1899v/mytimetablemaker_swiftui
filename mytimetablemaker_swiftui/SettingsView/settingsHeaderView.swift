//
//  settingsBackButton.swift
//  mytimetablemaker_swiftui
//
//  Created by 中島正雄 on 2021/02/15.
//

import SwiftUI

struct settingsHeaderView: View {
    
    @ObservedObject private var loginviewmodel: LoginViewModel

    init(
        _ loginviewmodel: LoginViewModel
    ) {
        self.loginviewmodel = loginviewmodel
    }
    
    let primary = Color(DefaultColor.primary.rawValue.colorInt)
    
    var body: some View {

        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        ZStack{
            primary.edgesIgnoringSafeArea(.top)
            VStack {
                Spacer()
                ZStack {
                    Text("Settings".localized)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            self.loginviewmodel.isMoveSettings = false
                        }) {
                            HStack {
                                Image("arrow_back_ios")
                                    .resizable()
                                    .frame(width: 10, height: 18)
                                    .padding(.leading, 20)
                            
                                Text("back".localized)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }
                }.padding(.bottom, 12)
            }
        }.frame(height: statusBarHeight + 60)
    }
}

struct settingsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let loginviewmodel = LoginViewModel()
        settingsHeaderView(loginviewmodel)
            .background(Color.myprimary)
    }
}
