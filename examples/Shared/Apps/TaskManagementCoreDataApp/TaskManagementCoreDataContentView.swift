//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 12/01/22.
//

import SwiftUI

struct TaskManagementCoreDataContentView: View {
    let persistenceController = TaskManagementCoreDataPersistenceController.shared
    var body: some View {
        TaskManagementCoreDataHome().environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
struct TaskManagementCoreDataContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskManagementCoreDataContentView()
    }
}
