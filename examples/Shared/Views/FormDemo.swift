//
//  FormDemo.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/02/13.
//

import SwiftUI

struct FormDemo: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var shouldSendNewsLetter = false
    @State private var numberOfLikes = 1
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Personal Information")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                }
                Section(header: Text("Actions")) {
                    Toggle("Send Newsletter", isOn: $shouldSendNewsLetter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of Likes", value: $numberOfLikes, in: 1...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Terms of Service", destination: URL(string: "www.google.com")!)
                }
            }
            .accentColor(.red)
            .navigationTitle("Account")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        saveUser()
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "backward")
                    }

                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        print(1)
                    } label: {
                        Text("1")
                    }

                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        print(2)
                    } label: {
                        Text("2")
                    }

                }
            }
            //如果这样写的话会造成stepper不能用
//            .onTapGesture {
//                hideKeyboard()
//            }
            
            
        }
    }
    func saveUser() {
        print("save user")
    }
}

struct FormDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormDemo()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
