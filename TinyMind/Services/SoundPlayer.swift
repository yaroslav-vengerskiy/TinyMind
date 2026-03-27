import AVFoundation
import UIKit

@MainActor
final class SoundPlayer: ObservableObject {
    private var player: AVAudioPlayer?
    private let synthesizer = AVSpeechSynthesizer()
    private let russianVoice: AVSpeechSynthesisVoice?

    init() {
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .mixWithOthers)
        try? AVAudioSession.sharedInstance().setActive(true)

        // Ищем русский голос (Milena — женский, высококачественный)
        russianVoice = AVSpeechSynthesisVoice.speechVoices()
            .filter { $0.language.hasPrefix("ru") }
            .sorted { $0.quality.rawValue > $1.quality.rawValue }
            .first
    }

    /// Воспроизводит аудиофайл из бандла
    func play(_ filename: String, extension ext: String = "m4a") {
        guard let url = Bundle.main.url(forResource: filename, withExtension: ext) else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {}
    }

    /// Произносит текст русским голосом
    func speak(_ text: String, rate: Float = 0.42) {
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = russianVoice
        utterance.rate = rate
        utterance.pitchMultiplier = 1.2  // чуть выше — дружелюбнее для детей
        utterance.volume = 1.0
        synthesizer.speak(utterance)
    }

    /// Воспроизводит звук животного, а через задержку — произносит фразу
    func playItemSound(_ item: GameItem) {
        // Пробуем воспроизвести звук из файла
        if let soundFile = item.soundFile {
            play(soundFile)
        }

        // Через задержку произносим фразу
        if let phrase = item.phrase {
            Task {
                try? await Task.sleep(for: .milliseconds(800))
                speak(phrase)
            }
        }
    }

    func stop() {
        player?.stop()
        synthesizer.stopSpeaking(at: .immediate)
    }
}
