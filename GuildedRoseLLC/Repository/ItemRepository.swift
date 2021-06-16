import Foundation

class ItemRepository {

    public func getItems(onSuccess: @escaping (_ : [Item]) -> Void) {
        var itemList: [Item]
        let args: String = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : ""
        switch args {
        case "NO_ITEMS_IN_STOCK":
            itemList = []
            onSuccess(itemList)
        case "SINGLE_TEST_ITEM":
            itemList = [Item.singleTestItem]
            onSuccess(itemList)
        case "THREE_TEST_ITEMS":
            itemList = [Item.singleTestItem, Item.singleTestItem, Item.singleTestItem,]
            onSuccess(itemList)
        default:
            itemList = []
            let url = URL(string: "https://floating-spire-59497.herokuapp.com/api/v1//items")
            guard let requestUrl = url else { fatalError() }
            var request = URLRequest(url: requestUrl)

            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let error = error {
                    return
                } else
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    
                    if let json = json {
                        itemList = json.map{
                            Item(json: $0)
                        }
                        onSuccess(itemList)
                    }
                }
            } )
            task.resume()
        }
    }
}
