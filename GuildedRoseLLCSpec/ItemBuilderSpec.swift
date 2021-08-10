import Quick
import Nimble
import GuildedRoseLLC
import UIKit

class ItemSpec: QuickSpec {
    
    override func spec() {
        
        describe("an ItemBuilder") {
            it("sets the name, sellin, quality") {
                let brie = ItemBuilder()
                    .set(name: "Brie")
                    .set(sellIn: 5)
                    .set(quality: 7)
                    .build()
                
                expect(brie.name).to(equal("Brie"))
                expect(brie.sellIn).to(equal(5))
                expect(brie.quality).to(equal(7))
            }
        }
    }
}
