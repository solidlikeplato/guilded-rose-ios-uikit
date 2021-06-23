import GuildedRoseLLC
import Quick
import Nimble

class FakeItemRepositorySpec: QuickSpec {
    
    override func spec() {
        
        describe("Getting the items") {
            it("calls the callback") {
                var wasCallbackCalled = false
                let itemRepository = FakeItemRepository()
                
                itemRepository.getItems(onSuccess: {_ in
                    wasCallbackCalled = true
                })
                
                expect(wasCallbackCalled).to(beTrue())
            }
            
            it("passes the subbed items to the callback") {
                let itemRepository = FakeItemRepository()
                let expectedItems = [Item(name: "FooBar")]
                itemRepository.stub(items: expectedItems)
                var actualItems: [Item] = []

                itemRepository.getItems(onSuccess: {items in
                    actualItems = items
                })
                expect(actualItems).to(equal(expectedItems))
            }
        }
    }
}
