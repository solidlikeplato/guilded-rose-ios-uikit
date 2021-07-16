import Quick
import Nimble
import GuildedRoseLLC
import UIKit

class ItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("an Item") {
            it("sets the name, sellin, quality from a data") {
                let brie = Item(name: "Brie", sellIn: 5, quality: 7)
                
                expect(brie.name).to(equal("Brie"))
                expect(brie.sellIn).to(equal(5))
                expect(brie.quality).to(equal(7))
            }
            
            it("sets the name from json") {
                let decoder = JSONDecoder()
            
                let brieJson = try? JSONSerialization.data(withJSONObject: ["id": 4, "name": "Aged Brie", "sellIn": 7, "quality": 5])
                let brie = try? decoder.decode(Item.self, from: brieJson!)
                
                expect(brie?.name).to(equal("Aged Brie"))
                expect(brie?.sellIn).to(equal(7))
                expect(brie?.quality).to(equal(5))
            }
        }
    }
}
