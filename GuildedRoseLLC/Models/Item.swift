import Foundation

public struct Item {
    public init(name: String) {
        self.name = name
    }
    public let name: String
    
    public static func getItems() -> [Item] {
        return testData
    }
    
}

extension Item:Equatable{
    public static func == (lhs:Item, rhs:Item) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Item {
    static var testData = [
        Item(name: "Foo"),
        Item(name: "Bar"),
        Item(name: "FooBar"),
        Item(name: "Lorem"),
        Item(name: "Ipsum"),
        Item(name: "VeniVidiVici"),
    ]
    static var noItemsInStock = Item(name: "Sold out, please check back later")
}
