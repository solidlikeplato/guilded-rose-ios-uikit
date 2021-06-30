import UIKit

public class RemoteItemRepository: ItemRepository {
    
    public init() {}
    
    public func getItems(onSuccess: @escaping ([Item]) -> Void) {
        let url = URL(string: "https://floating-spire-59497.herokuapp.com/api/v1/items")
        guard let requestURL = url else { fatalError("The internet is broken")}
        let request = URLRequest(url: requestURL)
        
        let task = URLSession.shared.dataTask(with: request) {data,response,error in
            if error != nil {
                return
            } else {
                if let data = data {
                    let itemList = self.parse(json: data)
                    onSuccess(itemList)
                }
            }
        }
        task.resume()
    }
    
    public func parse(json: Data) -> [Item] {
        let decoder = JSONDecoder()
        
        if let jsonItems: [Item] = try? decoder.decode ([Item].self, from: json) {
            let itemsList = jsonItems
            return itemsList
        }
        return []
    }
}
