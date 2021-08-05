public class StaticItemRepository : ItemRepository {
    
    public init() {}
    
    let testData = [
        ItemBuilder.build(name: "Foo", sellIn: 5, quality: 7),
        ItemBuilder.build(name: "Bar", sellIn: 5, quality: 7),
        ItemBuilder.build(name: "FooBar", sellIn: 5, quality: 7),
        ItemBuilder.build(name: "Lorem", sellIn: 5, quality: 7),
        ItemBuilder.build(name: "Ipsum", sellIn: 5, quality: 7),
        ItemBuilder.build(name: "VeniVidiVici", sellIn: 5, quality: 7)
    ]
    
    public func getItems(onSuccess: @escaping (_:[Item]) -> Void){

        let items: [Item] = testData
        
        onSuccess(items)
    }
}
