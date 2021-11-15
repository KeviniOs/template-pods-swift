import Foundation
import MPayBackendDrivenUI
@testable import ${POD_NAME}

final class MyScenePresenterSpy: MyScenePresenterProtocol {
    private(set) var presentLoadingCalled = false

    private(set) var presentWidgetsCalled = false
    private(set) var widgetsPassed: [Widget]?

    private(set) var presentErrorCalled = false
    private(set) var errorPassed: Error?

    func presentLoading() {
        presentLoadingCalled = true
    }

    func present(widgets: [Widget]) {
        presentWidgetsCalled = true
    }

    func present(error: Error) {
        presentErrorCalled = true
    }
}
