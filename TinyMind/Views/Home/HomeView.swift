import SwiftUI

struct HomeView: View {
    @Binding var selectedMode: GameMode?

    // MVP режимы
    private let modes: [GameMode] = [.animals, .music, .colors, .shapes, .counting, .guessSound]

    private let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
    ]

    var body: some View {
        ZStack {
            // Фон
            LinearGradient(
                colors: [Color(red: 0.53, green: 0.81, blue: 0.98), Color(red: 0.89, green: 0.95, blue: 1.0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                // Заголовок
                Text("TinyMind")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .shadow(radius: 2)

                // Сетка режимов
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(modes) { mode in
                        ModeButton(mode: mode) {
                            HapticManager.tap()
                            withAnimation(.easeInOut(duration: 0.25)) {
                                selectedMode = mode
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 40)
        }
    }
}

struct ModeButton: View {
    let mode: GameMode
    let action: () -> Void
    @State private var isPressed = false

    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                Image(systemName: mode.icon)
                    .font(.system(size: 44))
                    .foregroundStyle(.white)

                Text(mode.title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 130)
            .background(mode.color, in: RoundedRectangle(cornerRadius: 24))
            .shadow(color: mode.color.opacity(0.4), radius: 8, y: 4)
        }
        .buttonStyle(BounceButtonStyle())
    }
}

struct BounceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
