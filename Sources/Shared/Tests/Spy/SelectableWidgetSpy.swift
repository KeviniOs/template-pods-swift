import Foundation
import MPayBackendDrivenUI
@testable import ${POD_NAME}

class SelectableWidgetSpy: Widget, MySceneSelectableWidget {
    private(set) var selectCalled = false
    private(set) var visitorPassed: MySceneSelectableWidgetVisitor?

    init() { }
    required init(from decoder: Decoder) { }

    func select(using visitor: MySceneSelectableWidgetVisitor) {
        selectCalled = true
        visitorPassed = visitor
    }
}
