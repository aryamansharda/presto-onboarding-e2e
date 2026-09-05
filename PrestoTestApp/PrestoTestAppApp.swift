import SwiftUI
import PrestoTestAppFeature

@main
struct PrestoTestAppApp: App {
    init() {
        if ProcessInfo.processInfo.environment["PRESTO_RESET_FIXTURE_STATE"] == "1" {
            UserDefaults.standard.removeObject(forKey: "presto.fixture.count")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
