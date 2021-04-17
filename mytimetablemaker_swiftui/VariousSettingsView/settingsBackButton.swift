//
//  settingsBackButton.swift
//  mytimetablemaker_swiftui
//
//  Created by 中島正雄 on 2021/02/15.
//

import SwiftUI

struct settingsBackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("arrow_back_ios")
                    .foregroundColor(Color.white)
                Text("back".localized)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct settingsBackButton_Previews: PreviewProvider {
    static var previews: some View {
        settingsBackButton()
    }
}
