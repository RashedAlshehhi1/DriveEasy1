//
//  SplashScreenView.swift
//  DriveEasy
//
//  Created by Rashid Alshehhi.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            // Transitions to the LoginView after the splash animation finishes
            LoginView()
        } else {
            VStack {
                VStack(spacing: 16) {
                    // You can replace this SF Symbol with your custom Image asset (e.g., Image("DriveEasyIcon"))
                    Image(systemName: "car.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    Text("DriveEasy")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.primary)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    // Triggers the fade and scale in
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemBackground))
            .onAppear {
                // Waits for 2 seconds before dismissing the splash screen
                DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            // Test dark mode appearance natively in the canvas
            .preferredColorScheme(.dark)
    }
}
