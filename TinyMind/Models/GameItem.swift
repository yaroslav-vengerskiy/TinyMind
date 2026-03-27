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
    let imageName: String       // SF Symbol or asset name
    let imageColor: Color
    let soundFile: String?      // "cat_sound" (без расширения)
    let wordFile: String?       // "cat_word"
}

enum GameMode: String, CaseIterable, Identifiable {
    case animals = "animals"
    case objects = "objects"
    case guessSound = "guessSound"
    case colors = "colors"
    case shapes = "shapes"
    case counting = "counting"
    case music = "music"

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

    var icon: String {
        switch self {
        case .animals: return "cat.fill"
        case .objects: return "car.fill"
        case .guessSound: return "ear.fill"
        case .colors: return "paintpalette.fill"
        case .shapes: return "triangle.fill"
        case .counting: return "hand.fingers.spread"
        case .music: return "music.note"
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
