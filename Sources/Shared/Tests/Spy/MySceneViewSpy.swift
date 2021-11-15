import Foundation
@testable import ${POD_NAME}

class MySceneViewSpy: UIView, MySceneViewProtocol {
    private(set) var setupDelegateCalled = false
    private(set) var delegatePassed: MySceneViewDelegate?

    private(set) var setupBackgroundColorCalled = false

    private(set) var renderLoadingCalled = false

    private(set) var reloadTableDataCalled = false

    private(set) var renderErrorCalled = false
    private(set) var errorPassed: MySceneViewModel.Error?

    private(set) var indexPathForCellCalled = false
    var indexPathToReturn: IndexPath?

    func setup(delegate: MySceneViewDelegate) {
        setupDelegateCalled = true
        delegatePassed = delegate
    }

    func setupBackground(with color: UIColor) {
        setupBackgroundColorCalled = true
    }

    func renderLoading() {
        renderLoadingCalled = true
    }

    func reloadTableData() {
        reloadTableDataCalled = true
    }

    func render(_ errorViewModel: MySceneViewModel.Error) {
        renderErrorCalled = true
        errorPassed = errorViewModel
    }

    func indexPath(for cell: UITableViewCell) -> IndexPath? {
        indexPathForCellCalled = true
        return indexPathToReturn
    }
}
