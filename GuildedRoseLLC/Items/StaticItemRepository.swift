public class StaticItemRepository : ItemRepository {
    
    public init() {}
    
    let testData = [
        Item(name: "Foo"),
        Item(name: "Bar"),
        Item(name: "FooBar"),
        Item(name: "Lorem"),
        Item(name: "Ipsum"),
        Item(name: "VeniVidiVici"),
    ]
    
    public func getItems(onSuccess: @escaping (_:[Item]) -> Void){

        let items: [Item] = testData
        
        onSuccess(items)
    }
}
