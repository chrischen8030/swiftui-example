//
//  SwiftUIView.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2022/10/29.
//

import SwiftUI
import CoreMotion

class DepthEffectMotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        // this is very important
        motionManager.deviceMotionUpdateInterval = 1 / 15
        
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }

}

