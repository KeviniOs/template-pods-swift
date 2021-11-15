import XCTest
import MPayNavigationInterface
import MPayTestUtils
@testable import ${POD_NAME}

final class MySceneInteractorTests: XCTestCase, AsyncTest {
    private lazy var interactor = MySceneInteractor(dataStore: dataStoreSpy,
                                                    presenter: presenterSpy,
                                                    coordinator: coordinatorSpy,
                                                    dataProvider: dataProviderSpy,
                                                    errorHandlerService: errorHandlerServiceSpy)
    private let coordinatorSpy = MySceneCoordinatorSpy()
    private let presenterSpy = MyScenePresenterSpy()
    private let dataStoreSpy = MySceneDataStoreSpy()
    private let dataProviderSpy = MySceneDataProviderSpy()
    private let errorHandlerServiceSpy = ErrorHandlerServiceSpy()
    private let selectableWidgetSpy = SelectableWidgetSpy()
    private let mockAction = ActionMock()
    var expectations: [XCTestExpectation] = []

    func test_fetchMySceneData_shouldPresentWidgets() {
        dataProviderSpy.shouldFetchWithError = false

        interactor.fetchMySceneData()

        XCTAssertTrue(presenterSpy.presentLoadingCalled)
        XCTAssertTrue(dataProviderSpy.fetchMySceneDataCalled)
        addAsyncExpectation(self.dataStoreSpy.widgetsSetted)
        addAsyncExpectation(self.presenterSpy.presentWidgetsCalled)
        waitExpectations()
    }

    func test_fetchMySceneData_whenHaveError_shouldPresentError() {
        dataProviderSpy.shouldFetchWithError = true

        interactor.fetchMySceneData()

        XCTAssertTrue(presenterSpy.presentLoadingCalled)
        XCTAssertTrue(dataProviderSpy.fetchMySceneDataCalled)
        addAsyncExpectation(self.errorHandlerServiceSpy.handleErrorCalled)

        waitExpectations()

        errorHandlerServiceSpy.errorHandlerPassed?(ErrorMock())
        XCTAssertTrue(self.presenterSpy.presentErrorCalled)

        XCTAssertFalse(self.coordinatorSpy.handleActionCalled)
        errorHandlerServiceSpy.actionHandlerPassed?(ActionMock())
        XCTAssertTrue(self.coordinatorSpy.handleActionCalled)
    }

    func test_didSelectCell_shouldSelectWidget() {
        dataStoreSpy.widgets = [selectableWidgetSpy]

        interactor.didSelectCell(atIndexPath: IndexPath(row: 0, section: 0))

        XCTAssertTrue(selectableWidgetSpy.selectCalled)
        XCTAssertTrue(selectableWidgetSpy.visitorPassed as? MySceneInteractor === interactor)
    }

    func test_didSelectMySceneMyWidget_shouldHandleAction() {
        let widget = MySceneMyWidget(content: .init(action: AnyAction(action: mockAction)))

        interactor.didSelect(widget: widget)

        XCTAssertTrue(coordinatorSpy.handleActionCalled)
        XCTAssertTrue(coordinatorSpy.actionPassed as? ActionMock === mockAction)
    }
}
