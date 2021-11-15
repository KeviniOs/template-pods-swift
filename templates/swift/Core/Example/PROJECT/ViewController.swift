import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var performActionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPerformActionButton()
    }

    @IBAction func performActionTouched(_ sender: Any) {}

    private func setupPerformActionButton() {}
}
