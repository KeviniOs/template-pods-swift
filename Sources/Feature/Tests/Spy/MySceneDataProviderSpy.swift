import Foundation
import PromiseKit
import MPayTestUtils
@testable import ${POD_NAME}

final class MySceneDataProviderSpy: MySceneDataProviderProtocol {
    private(set) var fetchMySceneDataCalled = false
    var shouldFetchWithError = false

    func fetchMySceneData() -> Promise<MyScene.Response> {
        fetchMySceneDataCalled = true
        if shouldFetchWithError {
            return Promise<MyScene.Response>.init(error: ErrorMock())
        } else {
            return Promise<MyScene.Response>.value(MyScene.Response(widgets: []))
        }
    }
}
