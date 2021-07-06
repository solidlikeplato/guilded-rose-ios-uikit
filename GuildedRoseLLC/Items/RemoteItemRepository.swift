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
                    let itemList = ItemParser.parse(json: data)
                    onSuccess(itemList)
                }
            }
        }
        task.resume()
    }
}
