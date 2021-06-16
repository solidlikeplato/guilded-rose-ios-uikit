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
        var itemList: [Item] = []
        guard CommandLine.arguments.count > 1 else {
            ItemRepository().getItems {(items: [Item]) in
                for item in items {
                    print(item.name)
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
        var itemList: [Item] = []
        
        let url = URL(string: "https://floating-spire-59497.herokuapp.com/api/v1//items")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                return
            } else
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                
                if let json = json {
                    print("JSON", json)
                    itemList = json.map{
                        Item(json: $0)
                    }
                    print("ITEMLISTINSIDE", itemList)
                    onSuccess(itemList)
                }
            }
        }
        task.resume()
    }
}
