import SwiftUI

struct BackButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            HapticManager.light()
            action()
        }) {
            Image(systemName: "house.fill")
                .font(.system(size: 28))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(.ultraThinMaterial, in: Circle())
                .shadow(radius: 4)
        }
        .buttonStyle(BounceButtonStyle())
    }
}
