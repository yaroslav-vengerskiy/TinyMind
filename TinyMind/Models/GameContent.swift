import SwiftUI

struct GameContent {
    static let animals: [GameItem] = [
        GameItem(id: "cat", category: .animal, displayName: "Кошка", emoji: "🐱", imageName: "cat", soundFile: "cat_sound", phrase: "Как говорит кошка? Мяу!"),
        GameItem(id: "dog", category: .animal, displayName: "Собака", emoji: "🐶", imageName: "dog", soundFile: "dog_sound", phrase: "Как говорит собака? Гав-гав!"),
        GameItem(id: "cow", category: .animal, displayName: "Корова", emoji: "🐮", imageName: "cow", soundFile: "cow_sound", phrase: "Как говорит корова? Муу!"),
        GameItem(id: "horse", category: .animal, displayName: "Лошадь", emoji: "🐴", imageName: "horse", soundFile: "horse_sound", phrase: "Как говорит лошадь? Иго-го!"),
        GameItem(id: "chicken", category: .animal, displayName: "Курочка", emoji: "🐔", imageName: "chicken", soundFile: "chicken_sound", phrase: "Как говорит курочка? Ко-ко-ко!"),
        GameItem(id: "duck", category: .animal, displayName: "Уточка", emoji: "🦆", imageName: "duck", soundFile: "duck_sound", phrase: "Как говорит уточка? Кря-кря!"),
        GameItem(id: "pig", category: .animal, displayName: "Свинка", emoji: "🐷", imageName: "pig", soundFile: "pig_sound", phrase: "Как говорит свинка? Хрю-хрю!"),
        GameItem(id: "sheep", category: .animal, displayName: "Овечка", emoji: "🐑", imageName: "sheep", soundFile: "sheep_sound", phrase: "Как говорит овечка? Бее!"),
        GameItem(id: "lion", category: .animal, displayName: "Лев", emoji: "🦁", imageName: "lion", soundFile: "lion_sound", phrase: "Как говорит лев? Рррр!"),
        GameItem(id: "elephant", category: .animal, displayName: "Слон", emoji: "🐘", imageName: "elephant", soundFile: "elephant_sound", phrase: "Как говорит слон? Туу!"),
        GameItem(id: "frog", category: .animal, displayName: "Лягушка", emoji: "🐸", imageName: "frog", soundFile: "frog_sound", phrase: "Как говорит лягушка? Ква-ква!"),
        GameItem(id: "bird", category: .animal, displayName: "Птичка", emoji: "🐦", imageName: "bird", soundFile: "bird_sound", phrase: "Как говорит птичка? Чик-чирик!"),
        GameItem(id: "monkey", category: .animal, displayName: "Обезьянка", emoji: "🐵", imageName: "monkey", soundFile: "monkey_sound", phrase: "Как говорит обезьянка? У-у-у!"),
        GameItem(id: "mouse", category: .animal, displayName: "Мышка", emoji: "🐭", imageName: "mouse", soundFile: "mouse_sound", phrase: "Как говорит мышка? Пи-пи!"),
        GameItem(id: "rabbit", category: .animal, displayName: "Зайчик", emoji: "🐰", imageName: "rabbit", soundFile: "rabbit_sound", phrase: "Как говорит зайчик? Прыг-прыг!"),
        GameItem(id: "bear", category: .animal, displayName: "Мишка", emoji: "🐻", imageName: "bear", soundFile: "bear_sound", phrase: "Как говорит мишка? Рррр!"),
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
