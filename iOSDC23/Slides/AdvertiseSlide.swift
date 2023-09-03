import SwiftUI
import SlideKit

@Slide
struct AdvertiseSlide: View {
    var body: some View {
        HeaderSlide("宣伝") {
            HStack(alignment: .top, spacing: 32) {
                VStack(alignment: .leading) {
                    Text("OpenChatでも質問受け付けています\n(匿名でできます)")
                        .font(.system(size: 54, weight: .bold))
                        .foregroundStyle(Color.label)
                    Image(.openChat)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(48)
                .background {
                    Color.gray.opacity(0.3)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                }

                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading) {
                        Text("LINEスピーカースタンプラリー")
                            .font(.system(size: 54, weight: .bold))
                            .foregroundStyle(Color.label)
                    }
                    .padding(.vertical, 48)
                    .frame(width: 800)
                    .background {
                        Color.gray.opacity(0.3)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Image(.xBlack)
                                .resizable()
                                .bold()
                                .frame(width: 48, height: 48)
                            Text(": @mtj_j")
                        }
                        .font(.system(size: 54, weight: .bold))
                        .foregroundStyle(Color.label)
                    }
                    .padding(48)
                    .frame(width: 800)
                    .background {
                        Color.gray.opacity(0.3)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                    VStack(alignment: .leading) {
                        Text("囲碁友達\n募集中")
                        .font(.system(size: 110, weight: .bold))
                        .foregroundStyle(Color.label)
                    }
                    .padding(48)
                    .frame(width: 800, height: 375)
                    .background {
                        Color.gray.opacity(0.3)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                }
            }
        }
    }
}

struct AdvertiseSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            AdvertiseSlide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
        .itemStyle(CustomItemStyle())
    }
}
