import GuildedRoseLLC

class FakeItemRepository: ItemRepository {

    var itemsList: [Item] = []
    
    func getItems(onSuccess: @escaping ([Item]) -> Void) {
        onSuccess(itemsList)
    }
    
    func stub(items: [Item]) {
      itemsList = items
    }
}
