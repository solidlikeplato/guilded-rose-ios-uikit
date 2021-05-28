import Quick
import Nimble
import GuildedRoseLLC

class ItemSpec: QuickSpec {
    override func spec() {
        describe("an Item") {
            it("sets the name on instantiation") {
                let brie = Item(name: "Brie")
                expect(brie.name).to(equal("Brie"))
            }
        }
    }
}

