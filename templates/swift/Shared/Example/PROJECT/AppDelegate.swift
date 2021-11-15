import UIKit
import MPayNavigationInterface
import MPayActionBuilder

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let featureBuilder = FeatureBuilder()
        let actionBuilder = ActionBuilder(featureBuilder: featureBuilder,
                                          features: FeatureType.allCases,
                                          genericScreenDependencies: featureBuilder.genericScreenDependencies())
        ActionParser.instance.actionBuilder = actionBuilder

        return true
    }
}
