//
//  ContentView.swift
//  Courses
//
//  Created by Balaji on 17/08/20.
//

import SwiftUI

struct CoursesAppContentView: View {
    @State var doDismiss = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            CoursesAppCustomTabView(doDismiss: $doDismiss)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }.onChange(of: doDismiss) { newValue in
            dismiss()
        }
    }
}

struct CoursesAppContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesAppContentView()
    }
}

struct CoursesAppCustomTabView : View {
    @Binding var doDismiss:Bool
    @State var selectedTab = "home"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            // Using Tab View For Swipe Gestures...
            // if you dont need swipe gesture tab change means just use switch case....to switch views...
            
            TabView(selection: $selectedTab) {
                
                CoursesAppHome(doDismiss: $doDismiss)
                    .tag("home")
                
                CoursesAppEmail()
                    .tag("email")
                
                CoursesAppFolder()
                    .tag("folder")
                
                CoursesAppSettings()
                    .tag("settings")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            // for bottom overflow...
            
            HStack(spacing: 0){
                
                ForEach(CoursesAppTabs,id: \.self){image in
                    
                    CoursesAppTabButton(image: image, selectedTab: $selectedTab)
                    
                    // equal spacing...
                    
                    if image != CoursesAppTabs.last{
                        
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal,25)
            .padding(.vertical,5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            // for smaller iphones....
            // elevations...
            .padding(.bottom,edge!.bottom == 0 ? 20 : 0)
            
            // ignoring tabview elevation....
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

// tabs...
// Image Names...
var CoursesAppTabs = ["Courseshome","Coursesemail","Coursesfolder","Coursessettings"]

struct CoursesAppTabButton : View {
    
    var image : String
    @Binding var selectedTab : String
    
    var body: some View{
        
        Button(action: {selectedTab = image}) {
            
            Image(image)
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color("Coursestab") : Color.black.opacity(0.4))
                .padding()
        }
    }
}

struct CoursesAppHome : View {
    
    @State var txt = ""
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    @Binding var doDismiss:Bool
    var body: some View{
        
        VStack{
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Hello Carlos")
                        .font(.title)
                        .fontWeight(.bold)
                
                    Text("Let's upgrade your skill!")
                }
                .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    print("do click!")
                    doDismiss = !doDismiss
                }) {
                    
                    Image("Coursesprofile")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search Courses", text: $txt)
                    }
                    .padding(.vertical,12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
                    
                    HStack{
                        
                        Text("Categories")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            
                            Text("View All")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.top,25)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2),spacing: 20){
                        
                        ForEach(courses){course in
                            
                            NavigationLink(destination: CoursesAppDetailView(course: course)) {
                                
                                CourseCardView(course: course)
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding()
                .padding(.bottom,edge!.bottom + 70)
            }
        }
    }
}

struct CourseCardView : View {
    
    var course : CoursesAppCourse
    
    var body: some View{
        
        VStack{
            
            VStack{
                
                Image(course.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top,10)
                    .padding(.leading,10)
                    .background(Color(course.asset))
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(course.name)
                            .font(.title3)
                        
                        Text("\(course.numCourse) Courses")
                    }
                    .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(15)
            
            // or you can use max height in flexible in Grid Item....
            
            Spacer(minLength: 0)
        }
    }
}

// TabViews...

struct CoursesAppEmail : View {
    
    var body: some View{
        
        VStack{
            
            Text("Email")
        }
    }
}

struct CoursesAppFolder : View {
    
    var body: some View{
        
        VStack{
            
            Text("Folder")
        }
    }
}

struct CoursesAppSettings : View {
    
    var body: some View{
        
        VStack{
            
            Text("Settings")
        }
    }
}

// Model Data...

struct CoursesAppCourse : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var numCourse : Int
    var asset : String
}

// both image and color name is same so i used common word asset...

var courses = [

    CoursesAppCourse(name: "Coding", numCourse: 12,asset: "Coursescoding"),
    CoursesAppCourse(name: "Trading", numCourse: 12,asset: "Coursestrading"),
    CoursesAppCourse(name: "Cooking", numCourse: 12,asset: "Coursescooking"),
    CoursesAppCourse(name: "Marketing", numCourse: 12,asset: "Coursesmarketing"),
    CoursesAppCourse(name: "UI/UX", numCourse: 12,asset: "Coursesux"),
    CoursesAppCourse(name: "Digital Marketing", numCourse: 12,asset: "Coursesdigital")
]

struct CoursesAppDetailView : View {
    
    var course : CoursesAppCourse
    
    var body: some View{
        
        VStack{
            
            Text(course.name)
                .font(.title2)
                .fontWeight(.bold)
        }
        .navigationTitle(course.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
            
            Image("Coursesmenu")
                .renderingMode(.template)
                .foregroundColor(.gray)
        }))
    }
}
