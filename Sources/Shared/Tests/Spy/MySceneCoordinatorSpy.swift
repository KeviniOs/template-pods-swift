import Foundation
import MPayNavigationInterface
@testable import ${POD_NAME}

final class MySceneCoordinatorSpy: MySceneCoordinatorProtocol {
    private(set) var handleActionCalled = false
    private(set) var actionPassed: Action?

    func handle(_ action: Action?, animated: Bool) {
        handleActionCalled = true
        actionPassed = action
    }
}
