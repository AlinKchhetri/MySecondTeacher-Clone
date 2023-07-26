//
//  LottieView.swift
//  MST
//
//  Created by Alin Khatri on 30/06/2023.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "Loading")
        animationView.loopMode = .loop
                animationView.contentMode = .scaleAspectFit
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
        
    }
}
