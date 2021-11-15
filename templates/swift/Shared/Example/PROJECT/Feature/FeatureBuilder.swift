import MPayActionBuilderInterface
import MPayFeatureInterface
import MPayHelp
import MPayNavigation
import MPayNetwork
import MPayUI
import MPayUIProvider
import MPayErrorHandler
import ${POD_NAME}
import MPayGenericScreen
import MPayRouter

final class FeatureBuilder: FeatureBuilderProtocol {
    private lazy var errorPresenter = ErrorPresenter()
    private lazy var errorHandlerService = ErrorHandlerService()
    lazy var navigation = Navigation()
    let httpClient = HTTPFactory.create(
        certificatePinningConfig: nil,
        requestInfo: RequestInfo(
            baseURL: URL(string: "https://mpay-banking-app-mock-server.herokuapp.com/")!,
            timeoutInterval: nil,
            defaultHeaders: ["Cache-Control": "no-cache"]
        ),
        dataCompression: nil
    )
    private lazy var helpRouter = HelpRouter(dependencies: helpDependencies())
    private lazy var analyticsTracker = AnalyticsTracker()

    private var featureBuilder: [FeatureType: (() -> Feature?)]

    init() {
        MPayUI.UIProvider.inject(uiProvider: DefaultUIProvider())
        featureBuilder = [:]
        featureBuilder[.<#feature#>] = <#feature#>
        featureBuilder[.genericScreen] = genericScreen
    }

    func feature(type: FeatureTypeProtocol) -> Feature? {
        guard let type = type as? FeatureType else {
            return nil
        }
        return featureBuilder[type]?()
    }

    private func <#feature#>() -> ${POD_NAME}.Module {
        let dependencies = ${POD_NAME}.Dependencies(navigation: navigation,
                                                    httpClient: httpClient,
                                                    errorPresenter: errorPresenter,
                                                    errorHandlerService: errorHandlerService)
        return ${POD_NAME}.Module(dependencies: dependencies)
    }

    private func helpDependencies() -> MPayHelp.Dependencies {
        return MPayHelp.Dependencies(navigation: navigation,
                                     httpClient: httpClient,
                                     errorPresenter: errorPresenter,
                                     errorHandlerService: errorHandlerService,
                                     analyticsTracker: analyticsTracker)
    }

    private func genericScreen() -> MPayGenericScreen.Module {
        return MPayGenericScreen.Module(dependencies: genericScreenDependencies())
    }

    func genericScreenDependencies() -> MPayGenericScreen.Dependencies {
        return MPayGenericScreen.Dependencies(navigation: navigation,
                                              httpClient: httpClient,
                                              errorPresenter: errorPresenter,
                                              errorHandlerService: errorHandlerService,
                                              analyticsTracker: analyticsTracker,
                                              helpRouter: helpRouter)
    }
}
