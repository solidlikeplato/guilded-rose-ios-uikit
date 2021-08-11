public class ItemBuilder {
    public init() {}
    
    var name: String = ""
    var sellIn: Int = 0
    var quality: Int = 0

    public func set(name: String) -> ItemBuilder {
        self.name = name
        return self
    }
    
    public func set(sellIn: Int) -> ItemBuilder {
        self.sellIn = sellIn
        return self
    }
    
    public func set(quality: Int) -> ItemBuilder {
        self.quality = quality
        return self
    }
    
    public func build() -> Item {
        return Item(name: self.name, sellIn: self.sellIn, quality: self.quality)
    }
}
