//
//  Home.swift
//  StaggeredGrid (iOS)
//
//  Created by Balaji on 15/07/21.
//

import SwiftUI

struct StaggeredGridHome: View {
    @Environment(\.dismiss) var dismiss
    @State var posts: [StaggeredGridPost] = []
    
    // To show dynamic...
    @State var columns: Int = 2
    
    // Smooth Hero Effect...
    @Namespace var animation
    
    var body: some View {
        
        NavigationView{
            
            StaggeredGridStaggeredGrid(columns: columns, list: posts, content: { post in
                
                // Post Card View...
                StaggeredGridPostCardView(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
                    .onAppear {
                        print(post.imageURL)
                    }
            })
            .padding(.horizontal)
            .navigationTitle("Staggered Grid")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "backward")
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        columns += 1
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        columns = max(columns - 1, 1)
                    } label: {
                        Image(systemName: "minus")
                    }

                }
            }
            // animation...
            .animation(.easeInOut, value: columns)
        }
        .onAppear {
            
            for index in 1...10{
                posts.append(StaggeredGridPost(imageURL: "StaggeredGridpost\(index)"))
            }
        }
    }
}

struct StaggeredGridHome_Previews: PreviewProvider {
    static var previews: some View {
        StaggeredGridHome()
    }
}

// since we declared T as Identifiable...
// so we need to pass Idenfiable conform collection/Array...

struct StaggeredGridPostCardView: View{
    
    var post: StaggeredGridPost
    
    var body: some View{
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
