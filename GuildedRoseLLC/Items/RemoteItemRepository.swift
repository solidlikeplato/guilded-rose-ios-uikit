import UIKit

public class RemoteItemRepository: ItemRepository {
    public init() {}
    
    public func getItems(onSuccess: @escaping ([Item]) -> Void) {
        var itemList: [Item] = []
        
        let url = URL(string: "https://safe-wave-09726.herokuapp.com/api/v1/items")
        guard let requestURL = url else { fatalError("The internet is broken")}
        
        let request = URLRequest(url: requestURL)
        
        let task = URLSession.shared.dataTask(with: request) {data,response,error in
            if let error = error {
                print(error, "something went wrong")
                return
            } else {
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    if let json = json {
                        itemList = json.map{
                            Item(json: $0)
                        }
                        onSuccess(itemList)
                    }
                }
            }
        }
        task.resume()
    }
}
