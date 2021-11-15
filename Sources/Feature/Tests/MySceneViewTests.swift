import XCTest
import MPayUI
import MPayTestUtils
@testable import ${POD_NAME}

final class MySceneViewTests: XCTestCase {
    private lazy var view: MySceneView = {
        let view = MySceneView(emptyStateView: emptyStateSpy,
                               loadingView: loadingViewSpy,
                               tableView: tableViewSpy)
        view.setup(delegate: viewControllerSpy)
        return view
    }()
    private let viewControllerSpy = MySceneViewControllerSpy()
    private let loadingViewSpy = LoadingViewSpy()
    private let emptyStateSpy = EmptyStateViewSpy()
    private let tableViewSpy = TableViewSpy()

    func test_setupDelegate() {
        view.setup(delegate: viewControllerSpy)

        XCTAssertTrue(emptyStateSpy.setupDelegateCalled)
        XCTAssertTrue(emptyStateSpy.delegatePassed === viewControllerSpy)
        XCTAssertTrue(tableViewSpy.delegate === viewControllerSpy)
        XCTAssertTrue(tableViewSpy.dataSource === viewControllerSpy)
    }

    func test_setupBackground() {
        view.setupBackground(with: .blue)

        XCTAssertTrue(loadingViewSpy.bgColorSetted)
    }

    func test_renderLoading() {
        view.renderLoading()

        XCTAssertTrue(emptyStateSpy.isHidden)
        XCTAssertTrue(loadingViewSpy.showCalled)
    }

    func test_renderError() {
        view.render(.init(mode: EmptyStateMode()))

        XCTAssertTrue(loadingViewSpy.dismissCalled)
        XCTAssertFalse(emptyStateSpy.isHidden)
        XCTAssertTrue(emptyStateSpy.renderCalled)
    }

    func test_renderContent() {
        view.reloadTableData()

        XCTAssertTrue(loadingViewSpy.dismissCalled)
        XCTAssertTrue(emptyStateSpy.isHidden)
        XCTAssertTrue(viewControllerSpy.tableViewNumberOfRowsInSectionCalled)
    }

    func test_indexPathForCell() {
        _ = view.indexPath(for: UITableViewCell())

        XCTAssertTrue(tableViewSpy.indexPathForCellCalled)
    }
}
