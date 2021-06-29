public struct Item {
    
    public init(name: String) {
        self.name = name
    }
    
    public init(json: [String: Any]) {
        self.name = json["name"] as? String ?? "No name"
    }
    
    public let name: String
}

extension Item:Equatable{
    public static func == (lhs:Item, rhs:Item) -> Bool {
        return lhs.name == rhs.name
    }
}
