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
        describe("fetch items") {
            it("returns a list of items") {
                expect(Item.getItems()).to(equal(Item.testData))
                
            }
        }
    }
}



//let itemsList = [Item(name: "Foo"), Item(name:"Bar"), Item(name:"FooBar")]
