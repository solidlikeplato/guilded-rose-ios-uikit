import UIKit

public class ItemRepository {
    
    public init() {}
    
    public func getItems(onSuccess: @escaping (_:[Item]) -> Void){
        var items: [Item] = []
        
        let args: String = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : ""
        
        switch args {
        case "NO_ITEMS_IN_STOCK":
            items = []
        case "SINGLE_TEST_ITEM":
            items = [Item.singleTestItem]
        case "THREE_TEST_ITEMS":
            items = [Item.singleTestItem, Item.singleTestItem, Item.singleTestItem,]
        default:
            items = Item.testData
        }
        onSuccess(items)
    }
}
