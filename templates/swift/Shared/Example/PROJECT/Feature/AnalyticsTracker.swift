import Foundation
import MPayAnalyticsInterface

final class AnalyticsTracker: AnalyticsTrackerProtocol {
    func track(event: AnalyticsEvent) {
        print("=============================")
        print("Track event")
        print("id: \(event.id)")
        print("params: \(event.params)")
        print("revision: \(event.revision)")
        print("=============================")
    }

    func track(userProperty: String, value: FormattedValue) {
        print("Track userProperty: \(userProperty), value: \(value)")
    }

    func set(deviceId: String) {
        print("DeviceId: \(deviceId) was set.")
    }

    func set(userId: String) {
        print("UserId: \(userId) was set.")
    }

    func setAsUserId(infos: [String : String]) {
        print("set infos: \(infos) as userId")
    }

    func sessionId() -> String {
        return "mock"
    }

    func clearUserProperties() {
        print("Clear user properties")
    }
}
