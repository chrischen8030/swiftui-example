//
//  ColorsExtensionsHome.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2022/10/29.
//

import SwiftUI

struct ColorsExtensionsHome: View {
    @Environment(\.dismiss) var dismiss;
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "backward")
                }.padding()
                Spacer()
            }
            NavigationView {
                Form {
                    NavigationLink(
                        destination: RGB(),
                        label: { Text("RGB") })
                    NavigationLink(
                        destination: HEX(),
                        label: { Text("HEX") })
                    NavigationLink(
                        destination: HSV(),
                        label: { Text("HSV") })
                    NavigationLink(
                        destination: HSL(),
                        label: { Text("HSL") })
                    NavigationLink(
                        destination: CMYK(),
                        label: { Text("CMYK") })
                    NavigationLink(
                        destination: GetRGBA(),
                        label: { Text("Get RGBA") })
                    NavigationLink(
                        destination: Arithmetic(),
                        label: { Text("Arithmetic") })
                }
                .navigationBarTitle(Text("SwiftUIColor"))
            }
        }
        
    }
}

struct ColorsExtensionsHome_Previews: PreviewProvider {
    static var previews: some View {
        ColorsExtensionsHome()
    }
}
