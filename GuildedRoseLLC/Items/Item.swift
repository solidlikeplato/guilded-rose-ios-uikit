public struct Item: Codable {
    enum CodingKeys: String, CodingKey {
        case name, sellIn, quality
    }
        
    public var name: String
    public var sellIn: Int
    public var quality: Int
    
    
    public init(name: String) {
        self.name = name
        self.sellIn = 0
        self.quality = 0
    }
}

extension Item:Equatable{
    public static func == (lhs:Item, rhs:Item) -> Bool {
        return lhs.name == rhs.name
    }
}
