import SwiftUI

enum GameCategory: String, Codable, CaseIterable {
    case animal
    case transport
    case nature
    case instrument
}

struct GameItem: Identifiable, Hashable {
    let id: String
    let category: GameCategory
    let displayName: String
    let emoji: String
    let soundFile: String?
    let phrase: String?         // фраза для озвучки: "Это кошка! Мяу!"
}

enum GameMode: String, CaseIterable, Identifiable {
    case animals
    case objects
    case guessSound
    case colors
    case shapes
    case counting
    case music

    var id: String { rawValue }

    var title: String {
        switch self {
        case .animals: return "Животные"
        case .objects: return "Транспорт"
        case .guessSound: return "Угадай звук"
        case .colors: return "Цвета"
        case .shapes: return "Формы"
        case .counting: return "Считаем"
        case .music: return "Музыка"
        }
    }

    var emoji: String {
        switch self {
        case .animals: return "🐱"
        case .objects: return "🚗"
        case .guessSound: return "👂"
        case .colors: return "🎨"
        case .shapes: return "🔷"
        case .counting: return "🔢"
        case .music: return "🎵"
        }
    }

    var color: Color {
        switch self {
        case .animals: return .orange
        case .objects: return .blue
        case .guessSound: return .purple
        case .colors: return .pink
        case .shapes: return .green
        case .counting: return .cyan
        case .music: return .red
        }
    }
}
