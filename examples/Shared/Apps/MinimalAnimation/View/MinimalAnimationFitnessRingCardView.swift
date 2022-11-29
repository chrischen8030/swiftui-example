//
//  FitnessRingCardView.swift
//  MinimalAnimation-2 (iOS)
//
//  Created by Balaji on 11/03/22.
//

import SwiftUI

struct MinimalAnimationFitnessRingCardView: View {
    var body: some View {
        VStack(spacing: 15){
            Text("Progress")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack(spacing: 20){
                
                // Progress Ring
                ZStack{
                    ForEach(minimalAnimationRings.indices,id: \.self){index in
                        MinimalAnimationAnimatedRingView(ring: minimalAnimationRings[index], index: index)
                    }
                }
                .frame(width: 130, height: 130)
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(minimalAnimationRings){ring in
                        Label {
                            HStack(alignment: .bottom, spacing: 6) {
                                Text("\(Int(ring.progress))%")
                                    .font(.title3.bold())
                                
                                Text(ring.value)
                                    .font(.caption)
                            }
                        } icon: {
                         
                            Group{
                                if ring.isText{
                                    Text(ring.keyIcon)
                                        .font(.title2)
                                }
                                else{
                                    Image(systemName: ring.keyIcon)
                                        .font(.title2)
                                }
                            }
                            .frame(width: 30)
                        }
                    }
                }
                .padding(.leading,10)
            }
            .padding(.top,20)
        }
        .padding(.horizontal,20)
        .padding(.vertical,25)
        .background{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
}

struct MinimalAnimationFitnessRingCardView_Previews: PreviewProvider {
    static var previews: some View {
        MinimalAnimationHome()
    }
}

// Animating Rings
struct MinimalAnimationAnimatedRingView: View{
    var ring: MinimalAnimationRing
    var index: Int
    @State var showRing: Bool = false
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(.gray.opacity(0.3),lineWidth: 10)
            
            Circle()
                .trim(from: 0, to: showRing ? minimalAnimationRings[index].progress / 100 : 0)
                .stroke(minimalAnimationRings[index].keyColor,style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .rotationEffect(.init(degrees: -90))
        }
        .padding(CGFloat(index) * 16)
        .onAppear {
            // Show After Intial Animation Finished
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(Double(index) * 0.1)){
                    showRing = true
                }
            }
        }
    }
}
