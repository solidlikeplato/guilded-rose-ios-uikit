import Quick
import Nimble
import GuildedRoseLLC

class ItemRepositorySpec : QuickSpec {
    override func spec() {
        
        describe("getItems"){
            it("returns a static list of items") {
                expect(ItemRepository.getItems()).to(equal(Item.testData))
            }
        }
    }
}

