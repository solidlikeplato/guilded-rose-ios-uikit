public class StaticItemRepository : ItemRepository {
    
    public init() {}
    
    let testData = [
        ItemBuilder()
            .set(name: "Foo")
            .set(sellIn: 5)
            .set(quality: 7)
            .build(),
        
        ItemBuilder()
            .set(name: "Bar")
            .set(sellIn: 5)
            .set(quality: 7)
            .build(),
        
        ItemBuilder()
            .set(name: "FooBar")
            .set(sellIn: 5)
            .set(quality: 7)
            .build(),
        
        ItemBuilder()
            .set(name: "Lorem")
            .set(sellIn: 5)
            .set(quality: 7)
            .build(),
        
        ItemBuilder()
            .set(name: "Ipsum")
            .set(sellIn: 5)
            .set(quality: 7)
            .build(),
        
        ItemBuilder()
            .set(name: "VeniVidiVici")
            .set(sellIn: 5)
            .set(quality: 7)
            .build(),
    ]
    
    public func getItems(onSuccess: @escaping (_:[Item]) -> Void){

        let items: [Item] = testData
        
        onSuccess(items)
    }
}
