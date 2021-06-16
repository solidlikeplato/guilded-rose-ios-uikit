import UIKit

struct Item {
    
    public init(name: String) {
        self.name = name
    }
    
    public init(json: [String: Any]) {
        self.name = json["name"] as? String ?? "No Name"
    }
    
    public let name: String
    
    public static func getItems() -> [Item] {
        var itemList: [Item] = [singleTestItem]
        guard CommandLine.arguments.count > 1 else {
            let seconds = 0.02
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                ItemRepository().getItems {(items: [Item]) in
                    for item in items {
                        print(item.name)
                    }
                    print("items set")
                    itemList = items
                }
            }
            
            return itemList
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
    static var singleTestItem = Item(name: "Foo")
}



class ItemRepository {

    public func getItems(onSuccess: @escaping (_ : [Item]) -> Void) {
        onSuccess(Item.testData)
    }
}
