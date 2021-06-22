import UIKit

public class ItemRepository {
    public init() {}
    public static func getItems() -> [Item] {

        guard CommandLine.arguments.count > 1 else {
            return Item.testData
        }
        switch CommandLine.arguments[1] {
        case "NO_ITEMS_IN_STOCK":
            return []
        case "SINGLE_TEST_ITEM":
            return [Item.singleTestItem]
        case "THREE_TEST_ITEMS":
            return [Item.singleTestItem, Item.singleTestItem, Item.singleTestItem,]
        default:
            return Item.testData
        }
    }
}
