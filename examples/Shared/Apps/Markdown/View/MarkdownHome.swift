//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 16/07/21.
//

import SwiftUI

struct MarkdownHome: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "backward")
                }.padding()
                Spacer()

            }
            MarkDownView(markdown: parseMarkdown(markdown: markdownText))
                .ignoresSafeArea(.all,edges: .bottom)
            .navigationTitle("Markdown")
        }
    }
}

struct MarkdownContentView_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownHome()
    }
}

var markdownText = """
&nbsp;
# What it is?
MatchedGeometryEffect is used to smoothly animate views that is transitioning or moving from one place to another.

```swift
.matchedGeometryEffect(id: "YOUR_ID", in: NameSpaceID)
```
# Namespace
@Namespace creates a global namespace for your views that is used for animations.
In this example we animate view that is location at the topLeft of the screen.
When user taps, it will smoothly enlarge and move to the center of the screen.

```swift
@Namespace var NameSpaceID
```
# Step 3
In this example we will create a Image that will be positioned at topLeading of the view with the help of frame() property and when ever user taps on the Image we're transitioning the Image from topLeading to Center Smoothly using Geometry Effect.

Note: In a View only one MatchedGeometryID will be defined if the same ID repeats it will create glitch Animation.
That's why were removing the image using if...else so that the View will have only one ID defined.

```swift
struct ContentView: View {
    
    @Namespace var NameSpaceID
    
    @State var animateImage = false
    
    var body: some View {
        
        VStack{
            
            if animateImage{
                
                Image("picture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "IMAGE", in: NameSpaceID)
            }
            else{
                
                Image("picture")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "IMAGE", in: NameSpaceID)
                    .frame(width: 120, height: 120)
                
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                    .padding()
            }
        }
        .onTapGesture {
            
            // Do Changes with Animation
            
            withAnimation(.spring()){
                animateImage.toggle()
            }
        }
    }
}
```
"""
