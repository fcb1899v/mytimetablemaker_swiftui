//
//  MainHeaderView.swift
//  mytimetablemakers_swiftui
//
//  Created by 中島正雄 on 2021/03/20.
//

import SwiftUI

struct MainHeaderView: View {
    
    @ObservedObject private var loginviewmodel: LoginViewModel
    @ObservedObject private var mainviewmodel: MainViewModel
    @ObservedObject private var firestoreviewmodel: FirestoreViewModel

    init(
        _ loginviewmodel: LoginViewModel,
        _ mainviewmodel: MainViewModel,
        _ firestoreviewmodel: FirestoreViewModel
    ) {
        self.loginviewmodel = loginviewmodel
        self.mainviewmodel = mainviewmodel
        self.firestoreviewmodel = firestoreviewmodel
    }

    let primary = Color(DefaultColor.primary.rawValue.colorInt)
    
    var body: some View {
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        ZStack{
            primary
            VStack(spacing: 10) {
                
                Spacer()
                
                HStack{
                    Spacer(minLength: 30)
                    if (mainviewmodel.timeflag) {
                        mainviewmodel.dateTextView
                    } else {
                        datePickerLabelView(mainviewmodel)
                    }
                    Spacer(minLength: 30)
                    moveSettingsButton(loginviewmodel, mainviewmodel, firestoreviewmodel)
                    Spacer(minLength: 30)
                }
                
                HStack{
                    Spacer()
                    stateButton(
                        flag: mainviewmodel.goorbackflag,
                        label: "Back".localized,
                        action: mainviewmodel.backButtonChangeData
                    )
                    Spacer()
                    stateButton(
                        flag: !mainviewmodel.goorbackflag,
                        label: "Go".localized,
                        action: mainviewmodel.goButtonChangeData
                    )
                    Spacer()
                    stateButton(
                        flag: mainviewmodel.timeflag,
                        label: "Start".localized,
                        action: mainviewmodel.startButtonChangeData
                    )
                    Spacer()
                    stateButton(
                        flag: !mainviewmodel.timeflag,
                        label: "Stop".localized,
                        action: mainviewmodel.stopButtonChangeData
                    )
                    Spacer()
                }.padding(.bottom, 15)
            }
        }.frame(height: statusBarHeight + 90)
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let loginviewmodel = LoginViewModel()
        let mainviewmodel = MainViewModel()
        let firestoreviewmodel = FirestoreViewModel()
        MainHeaderView(loginviewmodel, mainviewmodel, firestoreviewmodel)
    }
}
