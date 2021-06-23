import Quick
import Nimble
import GuildedRoseLLC

class ItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("an Item") {
            it("sets the name from a string") {
                let brie = Item(name: "Brie")
                
                expect(brie.name).to(equal("Brie"))
            }
            
            it("sets the name from json") {
                let brie = Item(json: ["id": 4, "name": "Aged Brie", "sellIn": 7, "quality": 5])
                
                expect(brie.name).to(equal("Aged Brie"))
            }
        }
    }
}
