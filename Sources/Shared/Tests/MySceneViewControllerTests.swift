import XCTest
import MPayUI
@testable import ${POD_NAME}

final class MySceneViewControllerTests: XCTestCase {
    private lazy var viewController: MySceneViewController = MySceneViewController(interactor: interactorSpy,
                                                                                   customView: viewSpy,
                                                                                   title: "title")
    private let viewSpy = MySceneViewSpy()
    private let interactorSpy = MySceneInteractorSpy()

    func test_viewDidLoad_shouldFetchData() {
        viewController.viewDidLoad()

        XCTAssertTrue(interactorSpy.fetchMySceneDataCalled)
    }

    func test_selectCell_shouldCallInteractor() {
        let indexPath = IndexPath(row: 3, section: 0)
        viewController.tableView(UITableView(), didSelectRowAt: indexPath)

        XCTAssertTrue(interactorSpy.didSelectCellCalled)
        XCTAssertEqual(interactorSpy.indexPathPassed, indexPath)
    }

    func test_emptyStateViewButtonTouched_shouldCallInteractor() {
        viewController.emptyStateViewButtonTouched(in: EmptyStateView())

        XCTAssertTrue(interactorSpy.didTouchEmptyStateButtonCalled)
    }

    func test_renderLoading() {
        viewController.renderLoading()

        XCTAssertTrue(viewSpy.renderLoadingCalled)
    }

    func test_renderError() {
        viewController.render(error: .init(mode: EmptyStateMode()))

        XCTAssertTrue(viewSpy.renderErrorCalled)
    }

    func test_renderContent() {
        viewController.render(viewModel: .init(widgets: []))

        XCTAssertTrue(viewSpy.reloadTableDataCalled)
    }
}
