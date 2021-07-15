public class StaticItemRepository : ItemRepository {
    
    public init() {}
    
    let testData = [
        Item(name: "Foo", sellIn: 5, quality: 7),
        Item(name: "Bar", sellIn: 5, quality: 7),
        Item(name: "FooBar", sellIn: 5, quality: 7),
        Item(name: "Lorem", sellIn: 5, quality: 7),
        Item(name: "Ipsum", sellIn: 5, quality: 7),
        Item(name: "VeniVidiVici", sellIn: 5, quality: 7)
    ]
    
    public func getItems(onSuccess: @escaping (_:[Item]) -> Void){

        let items: [Item] = testData
        
        onSuccess(items)
    }
}
