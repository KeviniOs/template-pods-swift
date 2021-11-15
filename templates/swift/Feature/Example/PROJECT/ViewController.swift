import UIKit
import MPayNavigationInterface
import ${POD_NAME}
import MPayUI

class ViewController: MPayUI.ViewController {
    lazy var navigation: NavigationProtocol = FeatureBuilder().navigation

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonTouched(_ sender: UIButton) {
        let action = Bundle.main.decode(AnyAction.self, from: "action.json").action
        navigation.handle(action, animated: true, accessPoint: AccessPoint(), rootViewController: self)
    }

    @IBAction func startWithDeeplinkButtonTouched(_ sender: UIButton) {
        let url = URL(string: "mpayexamplefeature://movilepay/my_action?sceneTitle=my%20scene&title=my%20title&subtitle=my%20subtitle")!
        let action = AnyAction(from: url).action
        navigation.handle(action, animated: true, accessPoint: AccessPoint(), rootViewController: self)
    }
}
