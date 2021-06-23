public struct Item {
    
    public init(name: String) {
        self.name = name
    }
    
    public init(json: [String: Any]) {
        self.name = json["name"] as? String ?? "No name"
    }
    
    public let name: String
}

extension Item:Equatable{
    public static func == (lhs:Item, rhs:Item) -> Bool {
        return lhs.name == rhs.name
    }
}

public extension Item {
    static var testData = [
        Item(name: "Foo"),
        Item(name: "Bar"),
        Item(name: "FooBar"),
        Item(name: "Lorem"),
        Item(name: "Ipsum"),
        Item(name: "VeniVidiVici"),
    ]
    static var singleTestItem = Item(name: "Foo")
}
