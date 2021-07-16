import Quick
import Nimble
import GuildedRoseLLC
import UIKit

class ItemParserSpec : QuickSpec {
    
    override func spec() {
        
        describe("parse function"){
            context("properly formatted JSON"){
                
                it("parses a empty list into an empty list") {
                    let jsonItems = """
                        [
                        ]
                    """
                    let data = Data(jsonItems.utf8)
                    
                    let parsedData = ItemParser.parse(json: data)

                    expect(parsedData).to(equal([]))
                }
                it("parses a list of one named item into a list of one item") {
                    let jsonItems = """
                        [
                            {
                                "id": 24,
                                "name": "Foo",
                                "quality": 89,
                                "sellIn": 67
                            }
                        ]
                    """
                    let data = Data(jsonItems.utf8)
                    
                    let parsedData = ItemParser.parse(json: data)

                    expect(parsedData).to(equal([Item(name: "Foo", sellIn: 67, quality: 89)]))
                }
                
                it("parses a list of many named items into a list of items") {
                    let jsonItems = """
                        [
                            {
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
                    
                    let parsedData = ItemParser.parse(json: data)

                    expect(parsedData).to(equal([Item(name: "Foo", sellIn: 67, quality: 89), Item(name: "Bar", sellIn: 7, quality: 8)]))
                }
                
            }
            context("improperly formatted JSON object") {
                it("parses a list with no named items into an empty list") {
                    let jsonItemsWithNoName = """
                        [
                            {
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
                    
                    let parsedData = ItemParser.parse(json: data)

                    expect(parsedData).to(equal([]))
                }
                
                it("parses a empty string into an empty list") {
                    let jsonEmptyString = ""
                    let data = Data(jsonEmptyString.utf8)
                    
                    let parsedData = ItemParser.parse(json: data)

                    expect(parsedData).to(equal([]))
                }
                
                it("parses a gibberish string into an empty list") {
                    let gibberishString = """
                        5PePDoEiJC
                        NMD4xFaDKQ
                        SRbbTxw0Qz
                        IGEDHy36il
                        fvgSzg1Vsf
                        JJ5XuWjpAI
                        lsRec5lyrr
                        A6zYMO6Ozl
                        CwfNM07HXw
                        9kHcoImZsK
                        """
                    let data = Data(gibberishString.utf8)
                    
                    let parsedData = ItemParser.parse(json: data)
                    
                    expect(parsedData).to(equal([]))
                }
            }
        }
    }
}

