import XCTest
import MPayTestUtils
@testable import ${POD_NAME}

final class MySceneDataProviderTests: XCTestCase {
    private lazy var dataProvider = MySceneDataProvider(httpClient: httpClientSpy)
    private let httpClientSpy = HTTPClientSpy()

    func test_fetchMySceneData_shouldSendRequest() {
        _ = dataProvider.fetchMySceneData()

        XCTAssertTrue(httpClientSpy.sendCalled)
        XCTAssertNotNil(httpClientSpy.sendResourcePassed as? MyScene.Request)
    }
}
