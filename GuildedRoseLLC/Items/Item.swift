public struct Item: Codable {
    
    public init(name: String) {
        self.name = name
    }

    public let name: String
}

extension Item:Equatable{
    public static func == (lhs:Item, rhs:Item) -> Bool {
        return lhs.name == rhs.name
    }
}
