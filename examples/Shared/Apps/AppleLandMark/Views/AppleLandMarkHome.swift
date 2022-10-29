/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of all of the landmarks.
*/

import SwiftUI

struct AppleLandMarkHome: View {
    @State private var selection: Tab = .featured
    @StateObject private var modelData = ModelData();
    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }.environmentObject(modelData)
    }
}

struct AppleLandMarkHome_Previews: PreviewProvider {
    static var previews: some View {
        AppleLandMarkHome()
            .environmentObject(ModelData())
    }
}
