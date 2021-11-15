import Foundation
@testable import ${POD_NAME}

final class MySceneInteractorSpy: MySceneInteractorProtocol {
    private(set) var fetchMySceneDataCalled = false

    private(set) var didSelectCellCalled = false
    private(set) var indexPathPassed: IndexPath?

    private(set) var didTouchEmptyStateButtonCalled = false

    func fetchMySceneData() {
        fetchMySceneDataCalled = true
    }

    func didSelectCell(atIndexPath indexPath: IndexPath) {
        didSelectCellCalled = true
        indexPathPassed = indexPath
    }

    func didTouchEmptyStateButton() {
        didTouchEmptyStateButtonCalled = true
    }
}
