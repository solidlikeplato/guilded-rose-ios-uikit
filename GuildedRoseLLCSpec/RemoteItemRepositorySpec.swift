import Quick
import Nimble
import GuildedRoseLLC
import UIKit

class RemoteItemRepositorySpec : QuickSpec {
    
    override func spec() {
        
        describe("parse function"){
            it("parses a properly formattted json object into a list of items") {
                let itemRepository = RemoteItemRepository()
                let jsonItems = """
                    [{
                    "id": 24,
                    "name": "Foo",
                    "quality": 89,
                    "sellIn": 67
                  },
                  {
                    "id": 25,
                    "name": "Bar",
                    "quality": 8,
                    "sellIn": 7
                  }
                ]
                """
                let data = Data(jsonItems.utf8)
                
                let parsedData = itemRepository.parse(json: data)

                expect(parsedData).to(equal([Item(name: "Foo"), Item(name: "Bar")]))
            }
            
            it("returns an empty list for an improperly formatted JSON object") {
                let itemRepository = RemoteItemRepository()
                let jsonItemsWithNoName = """
                    [{
                    "id": 24,
                    "quality": 89,
                    "sellIn": 67
                  },
                  {
                    "id": 25,
                    "quality": 8,
                    "sellIn": 7
                  }
                ]
                """
                let data = Data(jsonItemsWithNoName.utf8)
                
                let parsedData = itemRepository.parse(json: data)

                expect(parsedData).to(equal([]))
            }
        }
    }
}

