import UIKit

public protocol ItemRepository {
    func getItems(onSuccess: @escaping (_:[Item]) -> Void)
}
