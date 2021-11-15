import Foundation
import MPayUI
@testable import ${POD_NAME}

final class MySceneViewControllerSpy: UIViewController, MySceneViewDelegate, MyScenePresenterDelegate {
    private(set) var emptyStateViewButtonTouchedCalled = false

    private(set) var renderLoadingCalled = false

    private(set) var renderViewModelCalled = false
    private(set) var viewModelPassed: MySceneViewModel.Content?

    private(set) var renderErrorCalled = false
    private(set) var errorPassed: MySceneViewModel.Error?

    private(set) var tableViewNumberOfRowsInSectionCalled = false

    func emptyStateViewButtonTouched(in emptyStateView: EmptyStateView) {
        emptyStateViewButtonTouchedCalled = true
    }

    func renderLoading() {
        renderLoadingCalled = true
    }

    func render(viewModel: MySceneViewModel.Content) {
        renderViewModelCalled = true
    }

    func render(error: MySceneViewModel.Error) {
        renderErrorCalled = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewNumberOfRowsInSectionCalled = true
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
