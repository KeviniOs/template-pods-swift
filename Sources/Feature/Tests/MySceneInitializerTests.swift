import XCTest
import MPayTestUtils
@testable import ${POD_NAME}

final class MySceneInitializerTests: XCTestCase {
    private lazy var dependencies = Dependencies(navigation: navigationSpy,
                                                 httpClient: httpClientSpy,
                                                 errorPresenter: errorPresenterSpy,
                                                 errorHandlerService: errorHandlerServiceSpy)
    private let navigationSpy = NavigationSpy()
    private let httpClientSpy = HTTPClientSpy()
    private let errorPresenterSpy = ErrorPresenterSpy()
    private let errorHandlerServiceSpy = ErrorHandlerServiceSpy()

    func test_createScene_shouldInitializeComponents() {
        let viewController = MySceneInitializer.createScene(dependencies: dependencies)

        do {
            let interactor: MySceneInteractor = try XCTUnwrap(mirror(from: viewController, property: "interactor"))
            let _: MySceneView = try XCTUnwrap(mirror(from: viewController, property: "customView"))

            let _: MySceneDataStore = try XCTUnwrap(mirror(from: interactor, property: "dataStore"))
            let presenter: MyScenePresenter = try XCTUnwrap(mirror(from: interactor, property: "presenter"))
            let coordinator: MySceneCoordinator = try XCTUnwrap(mirror(from: interactor, property: "coordinator"))
            let dataProvider: MySceneDataProvider = try XCTUnwrap(mirror(from: interactor, property: "dataProvider"))
            let errorHandlerService: ErrorHandlerServiceSpy = try XCTUnwrap(mirror(from: interactor, property: "errorHandlerService"))
            XCTAssertTrue(errorHandlerService === errorHandlerServiceSpy)

            let presenterViewController: MySceneViewController = try XCTUnwrap(mirror(from: presenter, property: "viewController"))
            let errorPresenter: ErrorPresenterSpy = try XCTUnwrap(mirror(from: presenter, property: "errorPresenter"))
            XCTAssertTrue(viewController === presenterViewController)
            XCTAssertTrue(errorPresenter === errorPresenterSpy)

            let navigation: NavigationSpy = try XCTUnwrap(mirror(from: coordinator, property: "navigation"))
            let accessPoint: AccessPoint = try XCTUnwrap(mirror(from: coordinator, property: "accessPoint"))
            let coordinatorViewController: MySceneViewController = try XCTUnwrap(mirror(from: coordinator, property: "rootViewController"))
            XCTAssertTrue(navigation === navigationSpy)
            XCTAssertTrue(viewController === coordinatorViewController)
            XCTAssertEqual(accessPoint, .myScene)

            let httpClient: HTTPClientSpy = try XCTUnwrap(mirror(from: dataProvider, property: "httpClient"))
            XCTAssertTrue(httpClient === httpClientSpy)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
