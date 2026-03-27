import SwiftUI

struct StarBurstView: View {
    @State private var stars: [(id: Int, x: CGFloat, y: CGFloat, scale: CGFloat, opacity: Double)] = []
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            ForEach(stars, id: \.id) { star in
                Image(systemName: "star.fill")
                    .font(.system(size: 24))
                    .foregroundStyle(.yellow)
                    .scaleEffect(isAnimating ? star.scale : 0)
                    .opacity(isAnimating ? star.opacity : 1)
                    .offset(x: isAnimating ? star.x : 0, y: isAnimating ? star.y : 0)
            }
        }
        .onAppear {
            stars = (0..<12).map { i in
                let angle = Double(i) * (360.0 / 12.0) * .pi / 180.0
                let distance: CGFloat = CGFloat.random(in: 80...150)
                return (
                    id: i,
                    x: cos(angle) * distance,
                    y: sin(angle) * distance,
                    scale: CGFloat.random(in: 0.5...1.5),
                    opacity: 0.0
                )
            }

            withAnimation(.easeOut(duration: 0.8)) {
                isAnimating = true
            }
        }
    }
}
