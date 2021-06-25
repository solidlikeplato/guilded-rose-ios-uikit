public class StaticItemRepository : ItemRepository {
    
    public init() {}
    
    public func getItems(onSuccess: @escaping (_:[Item]) -> Void){
        let items: [Item] = Item.testData
        
        onSuccess(items)
    }
}
