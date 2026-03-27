import SwiftUI

struct AnimalGridView: View {
    @EnvironmentObject var soundPlayer: SoundPlayer
    var onBack: () -> Void

    @State private var currentPage = 0
    @State private var tappedItem: GameItem?
    @State private var showStars = false

    private let pages = GameContent.pages(from: GameContent.animals, perPage: 4)

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {
        ZStack {
            // Фон
            Color(red: 1.0, green: 0.98, blue: 0.9)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                // Header
                HStack {
                    BackButton(action: onBack)
                    Spacer()
                    Text("Животные")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    Spacer()
                    // Баланс
                    Color.clear.frame(width: 56)
                }
                .padding(.horizontal, 16)

                // Карточки
                if currentPage < pages.count {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(pages[currentPage]) { item in
                            AnimalCardView(item: item, isTapped: tappedItem == item) {
                                onTap(item)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }

                Spacer()

                // Навигация страниц
                HStack(spacing: 40) {
                    Button {
                        withAnimation { currentPage = max(0, currentPage - 1) }
                    } label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(currentPage > 0 ? .blue : .gray.opacity(0.3))
                    }
                    .disabled(currentPage == 0)

                    // Точки страниц
                    HStack(spacing: 8) {
                        ForEach(0..<pages.count, id: \.self) { i in
                            Circle()
                                .fill(i == currentPage ? Color.orange : Color.gray.opacity(0.3))
                                .frame(width: 10, height: 10)
                        }
                    }

                    Button {
                        withAnimation { currentPage = min(pages.count - 1, currentPage + 1) }
                    } label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(currentPage < pages.count - 1 ? .blue : .gray.opacity(0.3))
                    }
                    .disabled(currentPage >= pages.count - 1)
                }
                .buttonStyle(BounceButtonStyle())
                .padding(.bottom, 20)
            }

            // Звёздочки
            if showStars {
                StarBurstView()
                    .allowsHitTesting(false)
            }
        }
    }

    private func onTap(_ item: GameItem) {
        HapticManager.tap()
        tappedItem = item
        soundPlayer.playWithWord(sound: item.soundFile, word: item.wordFile)

        // Звёздочки через секунду
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            showStars = true
            HapticManager.success()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                showStars = false
                tappedItem = nil
            }
        }
    }
}

struct AnimalCardView: View {
    let item: GameItem
    let isTapped: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                Image(systemName: item.imageName)
                    .font(.system(size: 60))
                    .foregroundStyle(item.imageColor)

                Text(item.displayName)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 160)
            .background(.white, in: RoundedRectangle(cornerRadius: 24))
            .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
            .scaleEffect(isTapped ? 1.15 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isTapped)
        }
        .buttonStyle(.plain)
    }
}
