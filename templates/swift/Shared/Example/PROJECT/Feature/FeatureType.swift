import MPayFeatureInterface
import ${POD_NAME}
import MPayActionBuilderInterface
import MPayGenericScreen

enum FeatureType: CaseIterable, FeatureTypeProtocol {
    case <#feature#>
    case genericScreen

    var configuration: FeatureConfiguration {
        switch self {
        case .<#feature#>:
            return FeatureConfiguration(metatype: ${POD_NAME}.Module.self, associatedTab: AppTab.example)
        case .genericScreen:
            return FeatureConfiguration(metatype: MPayGenericScreen.Module.self, associatedTab: nil)
        }
    }
}
