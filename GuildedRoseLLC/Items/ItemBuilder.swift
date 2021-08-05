import UIKit

public class ItemBuilder {
    public static func build(name: String) -> Item {
        return Item(name: name, sellIn: 1, quality: 2)
    }
    
    public static func build(name: String, sellIn: Int, quality: Int) -> Item {
        return Item(name: name, sellIn: sellIn, quality: quality)
    }
}
