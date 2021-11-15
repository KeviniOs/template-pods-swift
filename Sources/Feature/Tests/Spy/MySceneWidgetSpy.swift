import Foundation
import MPayBackendDrivenUI
import MPayTestUtils
@testable import ${POD_NAME}

class MySceneWidgetSpy: Widget, MySceneHasViewModelWidget {
    private(set) var viewModelUsingPresenterCalled = false
    private(set) var visitorPassed: MySceneHasViewModelVisitor?

    init() { }
    required init(from decoder: Decoder) { }

    func viewModel(using visitor: MySceneHasViewModelVisitor) -> WidgetViewModel {
        viewModelUsingPresenterCalled = true
        visitorPassed = visitor
        return WidgetViewModelMock()
    }
}
