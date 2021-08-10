import Quick
import Nimble
import GuildedRoseLLC

class ItemRepositorySpec : QuickSpec {
    
    override func spec() {
        
        describe("getItems"){
            it("sets a list of items") {
                let expectedTestData = [
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
                var data: [Item] = []
                let itemRepository = StaticItemRepository()
                
                itemRepository.getItems() {(items: [Item]) in
                    data = items
                }
                
                expect(data).to(equal(expectedTestData))
            }
        }
    }
}

