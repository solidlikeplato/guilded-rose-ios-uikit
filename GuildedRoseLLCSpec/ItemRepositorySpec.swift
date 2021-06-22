import Quick
import Nimble
import GuildedRoseLLC

class ItemRepositorySpec : QuickSpec {
    
    override func spec() {
        
        describe("getItems"){
            it("sets a list of items") {
                var data: [Item] = []
                let itemRepository = ItemRepository()
                itemRepository.getItems() {(items: [Item]) in
                    data = items
                }
                
                expect(data).to(equal(Item.testData))
            }
        }
    }
}

