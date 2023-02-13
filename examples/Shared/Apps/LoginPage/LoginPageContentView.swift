//
//  ContentView.swift
//  LoginPage
//
//  Created by Balaji on 23/07/20.
//

import SwiftUI

struct LoginPageContentView: View {
    var body: some View {
        
        // For Smaller Size iPhones...
        
        VStack{
            
            if UIScreen.main.bounds.height < 750{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LoginHome()
                }
            }
            else{
                
                LoginHome()
            }
        }
        .padding(.vertical)
    }
}

struct LoginPageContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageContentView()
    }
}

struct LoginHome : View {
    
    @State var index = 0
    @Namespace var name
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        
        VStack{
            
            Image("LoginPagelogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70).onTapGesture {
                    dismiss()
                }
            
            HStack(spacing: 0){
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        index = 0
                    }
                    
                }) {
                    
                    VStack{
                        
                        Text("Login")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black : .gray)
                        
                        ZStack{
                            
                            // slide animation....
                            
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame( height: 4)
                            
                            if index == 0{
                                
                                Capsule()
                                    .fill(Color("LoginPageColor"))
                                    .frame( height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        index = 1
                    }
                    
                }) {
                    
                    VStack{
                        
                        Text("Sign Up")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black : .gray)
                        
                        ZStack{
                            
                            // slide animation....
                            
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame( height: 4)
                            
                            if index == 1{
                                
                                Capsule()
                                    .fill(Color("LoginPageColor"))
                                    .frame( height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
            .padding(.top,30)
            
            // Login View...
            
            // Changing Views Based On Index...
            
            if index == 0{
                
                LoginPageLogin()
            }
            else{
                
                LoginPageSignUp()
            }
        }
    }
}


struct LoginPageLogin : View {
    
    @State var password = ""
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Hello Again,")
                        .fontWeight(.bold)
                    
                    Text("Justine")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button(action: {}) {
                        
                        Text("This isn't me")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color("LoginPageColor"))
                    }
                }
                
                Spacer(minLength: 0)
                
                
                Image("LoginPageprofile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 85, height: 85)
                    .clipShape(Circle())
            }
            .padding(.horizontal,25)
            .padding(.top,30)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Password")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                // shadow effect...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                Button(action: {}) {
                    
                    Text("Forget Password")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("LoginPageColor"))
                }
                .padding(.top,10)
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            // Login Button....
            
            Button(action: {}) {
                
                Text("Login")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                    
                        LinearGradient(gradient: .init(colors: [Color("LoginPageColor"),Color("LoginPageColor1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(8)
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            // Social Buttons...
            
            Button(action: {}) {
                
                HStack(spacing: 35){
                    
                    Image(systemName: "LoginPagefaceid")
                        .font(.system(size: 26))
                        .foregroundColor(Color("LoginPageColor"))
                    
                    Text("Login With Face ID")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("LoginPageColor"))
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color("LoginPageColor"),lineWidth: 1))
            }
            .padding(.top,35)
            .padding(.horizontal,25)
            
            HStack(spacing: 30){
                
                ForEach(loginPageSocial,id: \.self){name in
                    
                    Button(action: {}) {
                        
                        Image(name)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24,height: 24)
                            .foregroundColor(Color(name == "google" ? "LoginPageColor1" : "LoginPageColor"))
                    }
                }
            }
            .padding(.top,25)
        }
    }
}

var loginPageSocial = ["twitter","fb","google"]

struct LoginPageSignUp : View {
    
    @State var user = ""
    @State var password = ""
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                VStack(alignment: .leading, spacing: 12) {

                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer(minLength: 0)
                
            }
            .padding(.horizontal,25)
            .padding(.top,30)
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                Text("Username")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("email", text: $user)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                // shadow effect...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                Text("Password")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                // shadow effect...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            // Login Button....
            
            Button(action: {}) {
                
                Text("Sign Up")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                    
                        LinearGradient(gradient: .init(colors: [Color("LoginPageColor"),Color("LoginPageColor1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(8)
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            // Social Buttons...
            
            Button(action: {}) {
                
                HStack(spacing: 35){
                    
                    Image(systemName: "faceid")
                        .font(.system(size: 26))
                        .foregroundColor(Color("LoginPageColor"))
                    
                    Text("Sign Up With Face ID")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("LoginPageColor"))
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color("LoginPageColor"),lineWidth: 1))
            }
            .padding(.top,35)
            .padding(.horizontal,25)
            
            HStack(spacing: 30){
                
                ForEach(loginPageSocial,id: \.self){name in
                    
                    Button(action: {}) {
                        
                        Image(name)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24,height: 24)
                            .foregroundColor(Color(name == "google" ? "LoginPageColor1" : "LoginPageColor"))
                    }
                }
            }
            .padding(.top,25)
        }
    }
}
