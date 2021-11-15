import XCTest
import MPayTestUtils
@testable import ${POD_NAME}

final class MyScenePresenterTests: XCTestCase {
    private lazy var presenter: MyScenePresenter = {
        let presenter = MyScenePresenter(errorPresenter: errorPresenterSpy)
        presenter.viewController = viewControllerSpy
        return presenter
    }()
    private let viewControllerSpy = MySceneViewControllerSpy()
    private let widgetSpy = MySceneWidgetSpy()
    private let errorPresenterSpy = ErrorPresenterSpy()

    func test_presentLoading() {
        presenter.presentLoading()

        XCTAssertTrue(viewControllerSpy.renderLoadingCalled)
    }

    func test_presentError() {
        presenter.present(error: ErrorMock())

        XCTAssertTrue(errorPresenterSpy.emptyStateErrorViewModelCalled)
        XCTAssertTrue(viewControllerSpy.renderErrorCalled)
    }

    func test_renderWidgets() {
        presenter.present(widgets: [widgetSpy])

        XCTAssertTrue(widgetSpy.viewModelUsingPresenterCalled)
        XCTAssertTrue(widgetSpy.visitorPassed as? MyScenePresenter === presenter)
        XCTAssertTrue(viewControllerSpy.renderViewModelCalled)
    }
}
