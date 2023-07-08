import SwiftUI

struct AppIcon: View {
    var body: some View {
        GeometryReader { proxy in
            Image(.appicon)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(
                    cornerRadius: min(proxy.size.width, proxy.size.height) * 0.2125
                ))
                .shadow(radius: min(proxy.size.width, proxy.size.height) * 0.075)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

struct AppIcon_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
            AppIcon()
                .frame(width: 100)
        }
    }
}
