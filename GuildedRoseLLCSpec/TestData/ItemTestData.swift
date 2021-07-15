import GuildedRoseLLC

class ItemTestData {
    static func build(name: String) -> Item {
        return Item(name: name, sellIn: 1, quality: 2)
    }
}
