import XCTest
import MPayTestUtils
@testable import ${POD_NAME}

final class MySceneCoordinatorTests: XCTestCase {
    private lazy var coordinator: MySceneCoordinator = {
        let coordinator = MySceneCoordinator(navigation: navigationSpy)
        coordinator.rootViewController = viewControllerSpy
        return coordinator
    }()
    private let viewControllerSpy = MySceneViewControllerSpy()
    private let navigationSpy = NavigationSpy()
    private let mockAction = ActionMock()

    func test_handleAction_shouldCallNavigation() {
        coordinator.handle(mockAction, animated: false)

        XCTAssertTrue(navigationSpy.handleActionCalled)
        XCTAssertTrue(navigationSpy.actionPassed as? ActionMock === mockAction)
        XCTAssertEqual(navigationSpy.accessPointPassed as? AccessPoint, AccessPoint.myScene)
        XCTAssertEqual(navigationSpy.rootViewControllerPassed, viewControllerSpy)
    }
}
