import SwiftUI
import SlideKit
import Splash

@Slide
struct CodeSlide: View {
    let code: String
    let script: String

    init(_ code: String, script: String = "") {
        self.code = code
        self.script = script
    }

    var body: some View {
        Code(
            code,
            colorTheme: .presentation,
//            colorTheme: CodeColorTheme(
//                plainTextColor: Splash.Color(red: 0, green: 0, blue: 0),
//                tokenColors: [
//                    .keyword: Splash.Color(red: 0.60784314, green: 0.13333333, blue: 0.57647059),
//                    .string: Splash.Color(red: 0.729, green: 0.0, blue: 0.067),
//                    .type: Splash.Color(red: 0.10980392, green: 0.2745098, blue: 0.29411765),
//                    .call: Splash.Color(red: 0.267, green: 0.537, blue: 0.576),
//                    .number: Splash.Color(red: 0.0, green: 0.043, blue: 1.0),
//                    .comment: Splash.Color(red: 0.336, green: 0.376, blue: 0.42),
//                    .property: Splash.Color(red: 0.267, green: 0.537, blue: 0.576),
//                    .dotAccess: Splash.Color(red: 0.267, green: 0.537, blue: 0.576),
//                    .preprocessing: Splash.Color(red: 0.431, green: 0.125, blue: 0.051)
//                ]
//            ),
            fontSize: 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 48)
        .padding(.vertical, 100)
    }
}

struct CodeSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CodeSlide("let hoge = Hoge()")
        }
    }
}
