import Foundation
import MPayBackendDrivenUI
@testable import ${POD_NAME}

final class MySceneDataStoreSpy: MySceneDataStoreProtocol {
    private(set) var widgetsSetted = false

    var widgets: [Widget] = [] {
        didSet {
            widgetsSetted = true
        }
    }
}
