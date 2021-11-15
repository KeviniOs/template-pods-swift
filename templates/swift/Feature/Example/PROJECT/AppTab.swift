import Foundation
import MPayActionBuilderInterface

enum AppTab: Int {
    case home
    case example
}

extension AppTab: AppTabProtocol {
    var configuration: TabConfiguration {
        return TabConfiguration(title: "test",
                                image: UIImage(),
                                selectedImage: UIImage(),
                                type: "",
                                remoteConfigProvider: nil)
    }

    var index: Int? {
        return self.rawValue
    }
}
