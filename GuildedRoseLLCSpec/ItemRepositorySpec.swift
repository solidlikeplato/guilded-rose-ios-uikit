import Quick
import Nimble
import GuildedRoseLLC

class ItemRepositorySpec : QuickSpec {
    
    override func spec() {
        
        describe("getItems"){
            it("sets a list of items") {
                let expectedTestData = [
                    Item(name: "Foo"),
                    Item(name: "Bar"),
                    Item(name: "FooBar"),
                    Item(name: "Lorem"),
                    Item(name: "Ipsum"),
                    Item(name: "VeniVidiVici"),
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

