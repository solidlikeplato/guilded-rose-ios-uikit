struct Item {
    public init(name: String) {
        self.name = name
    }
    public let name: String
    
    public static func getItems() -> [Item] {

        guard CommandLine.arguments.count > 1 else {
            return testData
        }
        switch CommandLine.arguments[1] {
        case "NO_ITEMS_IN_STOCK":
            return []
        case "SINGLE_TEST_ITEM":
            return [singleTestItem]
        case "THREE_TEST_ITEMS":
            return [singleTestItem, singleTestItem, singleTestItem,]
        default:
            return testData
        }
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
    static var singleTestItem = Item(name: "Foo")
}
