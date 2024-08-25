import SwiftUI


struct WelcomeBackTopView: View {
    var body: some View {
        HStack(alignment: .center, content: {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundStyle(.inactiveGrey)
                .frame(width: 60, height: 60)
            VStack {
                Text("Welcome back,")
                    .foregroundStyle(.inactiveGrey)
                    .font(.system(size: 18))
                Text("Mazen")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
            }.padding(.leading, 5)
            Spacer()
        })
    }
}
