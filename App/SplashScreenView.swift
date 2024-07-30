import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(hex: "#2A2A2A") // Background color same as logo's background
                .edgesIgnoringSafeArea(.all)
            Image("C21Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200) // Adjusted size to be smaller
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
