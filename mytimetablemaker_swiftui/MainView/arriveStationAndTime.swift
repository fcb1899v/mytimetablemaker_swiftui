//
//  arriveStationAlertView.swift
//  mytimetablemakers_swiftui
//
//  Created by 中島正雄 on 2021/02/22.
//

import SwiftUI

struct arriveStationAndTime: View {
    
    @State private var isShowingAlert = false
    @State private var text = ""
    
    private let goorback: String
    private let keytag: String
    private let time: String
    
    /// 値を指定して生成する
    init(
        _ goorback: String,
        _ keytag: String,
        _ time: String
    ){
        self.goorback = goorback
        self.keytag = keytag
        self.time = time
    }

    var body: some View {
        
        let ofarrsta = "of arrival station ".localized
        let arrsta = "Arr. St. ".localized

        let title = DialogTitle.stationname.rawValue.localized
        let message = "\(ofarrsta)\(keytag)"
        let key = "\(goorback)arrivestation\(keytag)"
        let defaultvalue = "\(arrsta)\(keytag)"
        
        HStack {
            mainAlertLabel(title, message, key, defaultvalue)
            timeLabel(time)
        }
    }

    
}

struct arriveStationAndTime_Previews: PreviewProvider {
    static var previews: some View {
        arriveStationAndTime("back1", "1", "00:00")
    }
}

