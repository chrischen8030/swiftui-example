//
//  CardView.swift
//  Animated Header (iOS)
//
//  Created by Balaji on 09/01/21.
//

import SwiftUI

struct AnimatedHeaderCardView: View {
    var food: AnimatedHeaderFood
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading, spacing: 10, content: {
                
                Text(food.title)
                    .fontWeight(.bold)
                
                Text(food.description)
                    .font(.caption)
                    .lineLimit(3)
                
                Text(food.price)
                    .fontWeight(.bold)
            })
            
            Spacer(minLength: 10)
            
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}


//struct AnimatedHeaderCardView_Previews: PreviewProvider {
//    @StateObject static var homeData = AnimatedHeaderHomeViewModel()
//    static var previews: some View {
//        VStack {
//            AnimatedHeaderCardView()
//                .environmentObject(homeData)
//        }
//    }
//}
