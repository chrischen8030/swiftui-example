//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 02/05/22.
//

import SwiftUI

struct TaskManagerContentView: View {
    let persistenceController = TaskManagerPersistenceController.shared
    @Environment(\.dismiss) var dismiss;
    var body: some View {
        NavigationView{
            TaskManagerHome()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "backward")
                            }
                            Text("Task Manager")
                        }
                    }
                })
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct TaskManagerContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskManagerContentView()
    }
}
