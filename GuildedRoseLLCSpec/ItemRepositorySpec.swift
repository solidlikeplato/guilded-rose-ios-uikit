import Quick
import Nimble
import GuildedRoseLLC

class ItemRepositorySpec : QuickSpec {
    
    override func spec() {
        
        describe("getItems"){
            it("sets a list of items") {
                let expectedTestData = [
                    Item(name: "Foo", sellIn: 5, quality: 7),
                    Item(name: "Bar", sellIn: 5, quality: 7),
                    Item(name: "FooBar", sellIn: 5, quality: 7),
                    Item(name: "Lorem", sellIn: 5, quality: 7),
                    Item(name: "Ipsum", sellIn: 5, quality: 7),
                    Item(name: "VeniVidiVici", sellIn: 5, quality: 7)
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

