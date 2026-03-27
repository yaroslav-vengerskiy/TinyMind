import XCTest
@testable import TinyMind

final class GameContentTests: XCTestCase {
    func testAnimalCount() {
        XCTAssertGreaterThanOrEqual(GameContent.animals.count, 12)
    }

    func testInstrumentCount() {
        XCTAssertGreaterThanOrEqual(GameContent.instruments.count, 4)
    }

    func testPages() {
        let pages = GameContent.pages(from: GameContent.animals, perPage: 4)
        XCTAssertEqual(pages.count, 3) // 12 / 4
        XCTAssertEqual(pages[0].count, 4)
    }

    func testUniqueIds() {
        let ids = GameContent.animals.map(\.id)
        XCTAssertEqual(ids.count, Set(ids).count, "Animal IDs should be unique")
    }
}
