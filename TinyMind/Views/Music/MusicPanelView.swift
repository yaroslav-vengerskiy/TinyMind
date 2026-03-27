import SwiftUI

struct MusicPanelView: View {
    @EnvironmentObject var soundPlayer: SoundPlayer
    var onBack: () -> Void

    @State private var tappedId: String?

    private let instruments = GameContent.instruments

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {
        ZStack {
            // Фон
            LinearGradient(
                colors: [Color(red: 0.2, green: 0.1, blue: 0.4), Color(red: 0.4, green: 0.2, blue: 0.6)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                // Header
                HStack {
                    BackButton(action: onBack)
                    Spacer()
                    Text("Музыка")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Spacer()
                    Color.clear.frame(width: 56)
                }
                .padding(.horizontal, 16)

                // Инструменты
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(instruments) { instrument in
                        InstrumentButton(
                            instrument: instrument,
                            isTapped: tappedId == instrument.id
                        ) {
                            onTap(instrument)
                        }
                    }
                }
                .padding(.horizontal, 16)

                Spacer()
            }
            .padding(.top, 10)
        }
    }

    private func onTap(_ instrument: GameItem) {
        HapticManager.tap()
        tappedId = instrument.id
        soundPlayer.play(instrument.soundFile ?? "")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            tappedId = nil
        }
    }
}

struct InstrumentButton: View {
    let instrument: GameItem
    let isTapped: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 10) {
                Image(systemName: instrument.imageName)
                    .font(.system(size: 50))
                    .foregroundStyle(instrument.imageColor)

                Text(instrument.displayName)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 130)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
            .scaleEffect(isTapped ? 1.2 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.4), value: isTapped)
        }
        .buttonStyle(.plain)
    }
}
