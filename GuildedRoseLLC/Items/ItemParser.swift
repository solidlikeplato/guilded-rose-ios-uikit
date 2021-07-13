import UIKit

public class ItemParser {
    public init() {}
    
    public static func parse(json: Data) -> [Item] {
        let decoder = JSONDecoder()
        print("ITEMS LIST BEING DECODED.....")
        if let itemsList: [Item] = try? decoder.decode ([Item].self, from: json) {
            return itemsList
        }
        return []
    }
}
