import SwiftUI

@main
struct TinyMindApp: App {
    @StateObject private var soundPlayer = SoundPlayer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(soundPlayer)
        }
    }
}
