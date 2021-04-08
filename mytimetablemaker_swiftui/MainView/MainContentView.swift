//
//  MainContentView.swift
//  mytimetablemaker_swiftui
//  Created by Nakajima Masao on 2020/12/25.
//

import SwiftUI
import GoogleMobileAds


struct MainContentView: View {

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

    @State private var showSplash = true
    let primary = Color(DefaultColor.primary.rawValue.colorInt)
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    MainHeaderView(loginviewmodel, mainviewmodel, firestoreviewmodel)
                    ZStack {
                        Color.white
                        routeInfoArray(mainviewmodel)
                    }
                    Rectangle()
                        .foregroundColor(primary)
                        .frame(width: UIScreen.screenWidth, height: 1.5)
                    AdMobView()
                }
                LoginBackgroundView()
                    .opacity(showSplash ? 1 : 0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation() {
                                self.showSplash = false
                            }
                        }
                    }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
        }.preferredColorScheme(.dark)
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        let loginviewmodel = LoginViewModel()
        let mainviewmodel = MainViewModel()
        let firestoreviewmodel = FirestoreViewModel()
        MainContentView(loginviewmodel, mainviewmodel, firestoreviewmodel)
    }
}
