import SwiftUI

struct ContentView: View {
    @State private var selectedMode: GameMode?

    var body: some View {
        if let mode = selectedMode {
            modeView(for: mode)
                .transition(.move(edge: .trailing))
        } else {
            HomeView(selectedMode: $selectedMode)
                .transition(.move(edge: .leading))
        }
    }

    @ViewBuilder
    private func modeView(for mode: GameMode) -> some View {
        switch mode {
        case .animals:
            AnimalGridView(onBack: { goHome() })
        case .music:
            MusicPanelView(onBack: { goHome() })
        default:
            // Заглушка для будущих режимов
            VStack(spacing: 20) {
                Text(mode.title)
                    .font(.largeTitle)
                Text("Скоро!")
                    .font(.title2)
                    .foregroundStyle(.secondary)
                BackButton { goHome() }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
        }
    }

    private func goHome() {
        withAnimation(.easeInOut(duration: 0.25)) {
            selectedMode = nil
        }
    }
}
