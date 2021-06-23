import GuildedRoseLLC

public class FakeItemRepository: ItemRepository {

    public init() {}
    
    var itemsList: [Item] = []
    
    public func getItems(onSuccess: @escaping ([Item]) -> Void) {
        onSuccess(itemsList)
    }
    
    public func stub(items: [Item]) {
      itemsList = items
    }
}
