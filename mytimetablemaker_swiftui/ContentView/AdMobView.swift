//
//  AdMobView.swift
//  mytimetablemaker_swiftui
//
//  Created by 中島正雄 on 2021/04/06.
//

//import SwiftUI
//import GoogleMobileAds
//
//struct AdView: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> GADBannerView {
//        let adSize = GADAdSizeFromCGSize(CGSize(width: 320, height: 100))
//        let banner = GADBannerView(adSize: adSize)
//        banner.adUnitID = "ca-app-pub-1585283309075901/1821605177"
//        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
//        banner.load(GADRequest())
//        return banner
//    }
//
//    func updateUIView(_ uiView: GADBannerView, context: Context) {
//    }
//}
//
//struct AdMobView: View {
//
//    let admobflag = true
//
//    var body: some View {
//        if (admobflag) {
//            AdView()
//                .frame(width: 320, height: 50)
//                .offset(y: -14)
//        }
//    }
//}
//
//struct AdMobView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdMobView()
//            .background(Color.black)
//    }
//}
