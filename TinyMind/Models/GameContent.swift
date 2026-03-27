import SwiftUI

struct GameContent {
    static let animals: [GameItem] = [
        GameItem(id: "cat", category: .animal, displayName: "Кошка", emoji: "🐱", soundFile: "cat_sound", phrase: "Это кошка! Мяу!"),
        GameItem(id: "dog", category: .animal, displayName: "Собака", emoji: "🐶", soundFile: "dog_sound", phrase: "Это собака! Гав-гав!"),
        GameItem(id: "cow", category: .animal, displayName: "Корова", emoji: "🐮", soundFile: "cow_sound", phrase: "Это корова! Муу!"),
        GameItem(id: "horse", category: .animal, displayName: "Лошадь", emoji: "🐴", soundFile: "horse_sound", phrase: "Это лошадь! Иго-го!"),
        GameItem(id: "chicken", category: .animal, displayName: "Курочка", emoji: "🐔", soundFile: "chicken_sound", phrase: "Это курочка! Ко-ко-ко!"),
        GameItem(id: "duck", category: .animal, displayName: "Уточка", emoji: "🦆", soundFile: "duck_sound", phrase: "Это уточка! Кря-кря!"),
        GameItem(id: "pig", category: .animal, displayName: "Свинка", emoji: "🐷", soundFile: "pig_sound", phrase: "Это свинка! Хрю-хрю!"),
        GameItem(id: "sheep", category: .animal, displayName: "Овечка", emoji: "🐑", soundFile: "sheep_sound", phrase: "Это овечка! Бее!"),
        GameItem(id: "lion", category: .animal, displayName: "Лев", emoji: "🦁", soundFile: "lion_sound", phrase: "Это лев! Рррр!"),
        GameItem(id: "elephant", category: .animal, displayName: "Слон", emoji: "🐘", soundFile: "elephant_sound", phrase: "Это слон!"),
        GameItem(id: "frog", category: .animal, displayName: "Лягушка", emoji: "🐸", soundFile: "frog_sound", phrase: "Это лягушка! Ква-ква!"),
        GameItem(id: "bird", category: .animal, displayName: "Птичка", emoji: "🐦", soundFile: "bird_sound", phrase: "Это птичка! Чик-чирик!"),
        GameItem(id: "monkey", category: .animal, displayName: "Обезьянка", emoji: "🐵", soundFile: "monkey_sound", phrase: "Это обезьянка!"),
        GameItem(id: "mouse", category: .animal, displayName: "Мышка", emoji: "🐭", soundFile: "mouse_sound", phrase: "Это мышка! Пи-пи!"),
        GameItem(id: "rabbit", category: .animal, displayName: "Зайчик", emoji: "🐰", soundFile: "rabbit_sound", phrase: "Это зайчик!"),
        GameItem(id: "bear", category: .animal, displayName: "Мишка", emoji: "🐻", soundFile: "bear_sound", phrase: "Это мишка! Рррр!"),
    ]

    static let instruments: [GameItem] = [
        GameItem(id: "drum", category: .instrument, displayName: "Барабан", emoji: "🥁", soundFile: "drum", phrase: nil),
        GameItem(id: "bell", category: .instrument, displayName: "Колокольчик", emoji: "🔔", soundFile: "bell", phrase: nil),
        GameItem(id: "piano", category: .instrument, displayName: "Пианино", emoji: "🎹", soundFile: "piano", phrase: nil),
        GameItem(id: "guitar", category: .instrument, displayName: "Гитара", emoji: "🎸", soundFile: "guitar", phrase: nil),
        GameItem(id: "trumpet", category: .instrument, displayName: "Труба", emoji: "🎺", soundFile: "trumpet", phrase: nil),
        GameItem(id: "maracas", category: .instrument, displayName: "Маракасы", emoji: "🪇", soundFile: "maracas", phrase: nil),
    ]

    static func pages(from items: [GameItem], perPage: Int = 4) -> [[GameItem]] {
        stride(from: 0, to: items.count, by: perPage).map {
            Array(items[$0..<min($0 + perPage, items.count)])
        }
    }
}
