import Foundation

class MockItemRepository: Repository {
    var itemList: [Item] = []
    
    public init(items: [Item]) {
        self.itemList = items
    }
    
    public func getItems(onSuccess: @escaping (_ : [Item]) -> Void) {
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
            itemList = Item.testData
        }
        onSuccess(itemList)
    }
}
