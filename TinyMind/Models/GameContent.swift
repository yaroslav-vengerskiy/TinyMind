import SwiftUI

struct GameContent {
    static let animals: [GameItem] = [
        GameItem(id: "cat", category: .animal, displayName: "Кошка", imageName: "cat.fill", imageColor: .orange, soundFile: "cat_sound", wordFile: "cat_word"),
        GameItem(id: "dog", category: .animal, displayName: "Собака", imageName: "dog.fill", imageColor: .brown, soundFile: "dog_sound", wordFile: "dog_word"),
        GameItem(id: "bird", category: .animal, displayName: "Птица", imageName: "bird.fill", imageColor: .cyan, soundFile: "bird_sound", wordFile: "bird_word"),
        GameItem(id: "fish", category: .animal, displayName: "Рыбка", imageName: "fish.fill", imageColor: .blue, soundFile: "fish_sound", wordFile: "fish_word"),
        GameItem(id: "ladybug", category: .animal, displayName: "Божья коровка", imageName: "ladybug.fill", imageColor: .red, soundFile: "ladybug_sound", wordFile: "ladybug_word"),
        GameItem(id: "hare", category: .animal, displayName: "Зайчик", imageName: "hare.fill", imageColor: .gray, soundFile: "hare_sound", wordFile: "hare_word"),
        GameItem(id: "tortoise", category: .animal, displayName: "Черепаха", imageName: "tortoise.fill", imageColor: .green, soundFile: "tortoise_sound", wordFile: "tortoise_word"),
        GameItem(id: "ant", category: .animal, displayName: "Муравей", imageName: "ant.fill", imageColor: .brown, soundFile: "ant_sound", wordFile: "ant_word"),
        GameItem(id: "cow", category: .animal, displayName: "Корова", imageName: "pawprint.fill", imageColor: .brown, soundFile: "cow_sound", wordFile: "cow_word"),
        GameItem(id: "horse", category: .animal, displayName: "Лошадь", imageName: "figure.equestrian.sports", imageColor: .brown, soundFile: "horse_sound", wordFile: "horse_word"),
        GameItem(id: "chicken", category: .animal, displayName: "Курочка", imageName: "bird.fill", imageColor: .yellow, soundFile: "chicken_sound", wordFile: "chicken_word"),
        GameItem(id: "frog", category: .animal, displayName: "Лягушка", imageName: "leaf.fill", imageColor: .green, soundFile: "frog_sound", wordFile: "frog_word"),
    ]

    static let instruments: [GameItem] = [
        GameItem(id: "drum", category: .instrument, displayName: "Барабан", imageName: "circle.circle.fill", imageColor: .red, soundFile: "drum", wordFile: nil),
        GameItem(id: "bell", category: .instrument, displayName: "Колокольчик", imageName: "bell.fill", imageColor: .yellow, soundFile: "bell", wordFile: nil),
        GameItem(id: "piano", category: .instrument, displayName: "Пианино", imageName: "pianokeys", imageColor: .white, soundFile: "piano", wordFile: nil),
        GameItem(id: "guitar", category: .instrument, displayName: "Гитара", imageName: "guitars.fill", imageColor: .orange, soundFile: "guitar", wordFile: nil),
        GameItem(id: "tambourine", category: .instrument, displayName: "Бубен", imageName: "circle.dotted", imageColor: .purple, soundFile: "tambourine", wordFile: nil),
        GameItem(id: "xylophone", category: .instrument, displayName: "Ксилофон", imageName: "music.note.list", imageColor: .cyan, soundFile: "xylophone", wordFile: nil),
    ]

    /// Возвращает страницы по 4 карточки
    static func pages(from items: [GameItem], perPage: Int = 4) -> [[GameItem]] {
        stride(from: 0, to: items.count, by: perPage).map {
            Array(items[$0..<min($0 + perPage, items.count)])
        }
    }
}
