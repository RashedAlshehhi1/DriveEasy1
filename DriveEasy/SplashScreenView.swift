import SwiftUI

struct SplashScreenView: View {
    @Binding var isSplashFinished: Bool
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    isSplashFinished = true
                }
            }
        }
    }
}

// The PreviewProvider needs a "constant" binding to preview the view in isolation
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(isSplashFinished: .constant(false))
    }
}
