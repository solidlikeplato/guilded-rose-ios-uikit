import Foundation

public struct Item {
    public let name: String
    
    public static func getItems() -> [Item] {
        return [Item(name: "Foo"), Item(name:"Bar"), Item(name:"FooBar")]
    }
}

extension Item:Equatable{
    public static func == (lhs:Item, rhs:Item) -> Bool {
        return lhs.name == rhs.name
    }
}
