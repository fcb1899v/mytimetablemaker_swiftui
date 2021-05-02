//
//  TimetableGridView.swift
//  mytimetablemaker_swiftui
//
//  Created by 中島正雄 on 2021/03/03.
//

import SwiftUI

struct TimetableGridView: View {

    @State private var isShowingAlert = false
    @State private var isShowingPicker = false
    @State private var text = ""
    @State private var label = ""
    
    private let goorback: String
    private let weekflag: Bool
    private let num: Int

    init(
        _ goorback: String,
        _ weekflag: Bool,
        _ num: Int
    ) {
        self.goorback = goorback
        self.weekflag = weekflag
        self.num = num
    }
    
    var body: some View {
        
        let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
        let timetable = Timetable(goorback, weekflag, num)
        
        ScrollView {
            
            ZStack {
                
                Color.white
                
                VStack(spacing: 0.5) {
                    
                    ZStack {
                        Color.white
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 1) {
                            Color.primary.frame(height: 0)
                            HStack(spacing: 1) {
                                Color.white.frame(width: 1)
                                ZStack(alignment: .center) {
                                    Color.primary
                                        .frame(height: 25)
                                    Text(weekflag.weekLabelText)
                                        .foregroundColor(weekflag.weekLabelColor)
                                        .fontWeight(.bold)
                                }
                                Color.white.frame(width: 1)
                            }
                        }
                    }
                    
                    Color.white.frame(height: 0)

                    ForEach(4...25, id: \.self) { hour in
                        ZStack {
                            Color.white
                            LazyVGrid(columns: [GridItem(.flexible())], spacing: 1) {
                                HStack(spacing: 1) {
                                    Color.white.frame(width: 1)
                                    ZStack {
                                        Color.primary.frame(width: 27)
                                        Text(hour.addZeroTime).foregroundColor(Color.accent)
                                    }
                                    Button (action: {
                                        self.isShowingAlert = true
                                    }) {
                                        ZStack(alignment: .leading) {
                                            Color.primary.frame(width: UIScreen.screenWidth - 30)
                                            Button (action: {
                                                self.isShowingAlert = true
                                            }) {
                                                ZStack(alignment: .leading) {
                                                    Text(label)
                                                        .foregroundColor(.white)
                                                        .onReceive(timer) { (_) in
                                                            label = timetable.timetableTime(hour)
                                                        }
                                                    timeFieldAlertView(
                                                        text: $text,
                                                        isShowingAlert: $isShowingAlert,
                                                        isShowingPicker: $isShowingPicker,
                                                        title: DialogTitle.adddeletime.rawValue.localized,
                                                        message: timetable.timetableAlertMessage(hour),
                                                        key: timetable.timetableKey(hour),
                                                        maxnumber: 59
                                                    )
                                                    .actionSheet(isPresented: $isShowingPicker) {
                                                        timetable.copyTimetableSheet(hour)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    Color.white.frame(width: 1)
                                }
                            }
                        }
                    }
                    Color.white.frame(height: 0)
                }
            }
        }
    }
}
    
struct TimetableGridView_Previews: PreviewProvider {
    static var previews: some View {
        let weekflag = Date().weekFlag
        TimetableGridView("back1", weekflag, 0)
    }
}
