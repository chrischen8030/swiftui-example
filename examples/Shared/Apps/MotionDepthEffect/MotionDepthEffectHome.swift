//
//  MotionDepthEffectHome.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2022/10/29.
//

import SwiftUI

struct MotionDepthEffectHome: View {
    @StateObject private var motion = DepthEffectMotionManager()
    @State private var showDouble = false
    @State private var show3dEffect = false
    var body: some View {
        VStack {
            Button {
                showDouble = true;
            } label: {
                Text("show double shadow")
            }.fullScreenCover(isPresented: $showDouble) {
                DoubleShadow().environmentObject(motion)
            }
            Button {
                show3dEffect = true;
            } label: {
                Text("show 3d Effect")
            }.fullScreenCover(isPresented: $show3dEffect) {
                Effect3DView().environmentObject(motion)
            }

        }
    }
}

struct DoubleShadow: View {
    @EnvironmentObject var motion : DepthEffectMotionManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "backward")
                }
                .padding()
                Spacer()
            }.font(.system(size:15))
            if #available(iOS 16.0, *) {
                VStack {

                    Text("?")
                    Image(systemName: "arrow.down.message.fill")
                }
                .foregroundStyle(
                    .blue
                    .gradient
                    .shadow(
                        .inner(color:.black, radius: 10, x:motion.x * 50, y:motion.y * 50)
                    )
                    //double shadow
                    .shadow(
                        .drop(color:.black.opacity(0.2), radius: 10, x: motion.x * 50, y: motion.y * 50)
                    )
                )
                .font(.system(size: 300).bold())
            } else {
                // Fallback on earlier versions
                Text("Please test code in iOS16 system")
            }
        }
    }
}

struct Effect3DView: View {
    @EnvironmentObject var motion : DepthEffectMotionManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "backward")
                }
                .padding()
                Spacer()
            }.font(.system(size:15))
            if #available(iOS 16.0, *) {
                Image(systemName: "arrow.down.message.fill")
                    .foregroundStyle(
                        .blue.gradient.shadow(.inner(color:.black, radius: 10, x:motion.x * -20, y:motion.y * -20))
                    )
                    .font(.system(size: 300).bold())
                    .rotation3DEffect(.degrees(motion.x * 20), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(motion.y * 20), axis: (x: 1, y: 0, z: 0))
            } else {
                // Fallback on earlier versions
                Text("Please test code in iOS16 system")
            }
        }
    }
}

struct MotionDepthEffectHome_Previews: PreviewProvider {
    static var previews: some View {
        MotionDepthEffectHome()
    }
}
