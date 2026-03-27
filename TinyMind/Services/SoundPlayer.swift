import AVFoundation
import UIKit

final class SoundPlayer: ObservableObject {
    private var player: AVAudioPlayer?

    init() {
        // Настраиваем аудио-сессию для воспроизведения вместе с другими приложениями
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .mixWithOthers)
        try? AVAudioSession.sharedInstance().setActive(true)
    }

    func play(_ filename: String, extension ext: String = "m4a") {
        guard let url = Bundle.main.url(forResource: filename, withExtension: ext) else {
            // Файл не найден — играем системный звук как fallback
            playSystemSound()
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            playSystemSound()
        }
    }

    /// Воспроизводит звук, а через задержку — слово
    @MainActor
    func playWithWord(sound: String?, word: String?, delay: TimeInterval = 0.8) {
        if let sound {
            play(sound)
        }

        if let word {
            Task { @MainActor [weak self] in
                try? await Task.sleep(for: .milliseconds(Int(delay * 1000)))
                self?.play(word)
            }
        }
    }

    func stop() {
        player?.stop()
    }

    private func playSystemSound() {
        AudioServicesPlaySystemSound(1104) // тихий тап
    }
}
